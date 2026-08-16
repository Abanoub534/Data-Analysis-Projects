USE [potato chip]

SELECT *
FROM purchase;

-- lets see data types
EXEC sp_help 'purchase';

-- LYLTY_CARD_NBR has been entered as varchar lets convert it to INT but first lets sure that all values are ready to convert 
SELECT LYLTY_CARD_NBR
FROM purchase 
WHERE TRY_CAST(LYLTY_CARD_NBR AS INT) IS NULL 
AND LYLTY_CARD_NBR IS NOT NULL;

-- nice lets convert it 

ALTER TABLE purchase
ALTER COLUMN LYLTY_CARD_NBR INT;

-- LYLTY_CARD_NBR should be unique value so lets look for duplicates in this column

WITH duplicates_cte AS(
SELECT *, 
ROW_NUMBER() OVER (
PARTITION BY LYLTY_CARD_NBR ORDER BY LYLTY_CARD_NBR) AS row_num
FROM purchase
)
SELECT *
FROM duplicates_cte 
WHERE row_num > 1

-- no dublicates thats actually good

SELECT LIFESTAGE
FROM purchase
GROUP BY LIFESTAGE;

/* purchase data is categorized with this types
1- young, midage, older SINGLES/COUPLES
2- new, young, older FAMILIES 
no wrong or need to be edited names */

SELECT PREMIUM_CUSTOMER
FROM purchase
GROUP BY PREMIUM_CUSTOMER;

/* Customer purchase rate was divided into 3 sections : 
1- Premium
2- Mainstream 
3- Budget */

-- let's look for nulls

SELECT *
FROM purchase
WHERE LYLTY_CARD_NBR IS NULL 
OR LIFESTAGE IS NULL
OR PREMIUM_CUSTOMER IS NULL;

-- not a single cell thats amazing, lets go to transaction data 

SELECT * 
FROM transctions;

EXEC sp_help 'transctions';

-- same things lets look for duplicates first 

WITH duplicates_cte AS(
SELECT *, 
ROW_NUMBER() OVER (
PARTITION BY LYLTY_CARD_NBR, DATE, STORE_NBR, TXN_ID, PROD_NBR, PROD_NAME, PROD_QTY, TOT_SALES ORDER BY LYLTY_CARD_NBR) AS row_num
FROM transctions
)
SELECT *
FROM duplicates_cte 
WHERE row_num > 1

--no duplicates found 

-- TXN_ID shoud be unique value lets check that
WITH check_txn AS (
    SELECT TXN_ID
    FROM transctions
    GROUP BY TXN_ID
    HAVING COUNT(DISTINCT DATE) > 1
)
SELECT t.*
FROM transctions t
JOIN check_txn b
    ON t.TXN_ID = b.TXN_ID
ORDER BY t.TXN_ID, t.DATE;

-- lets delete that

WITH check_txn AS (
    SELECT TXN_ID
    FROM transctions
    GROUP BY TXN_ID
    HAVING COUNT(DISTINCT DATE) > 1
)
DELETE t
FROM transctions t
JOIN check_txn b
    ON t.TXN_ID = b.TXN_ID;

-- Let's look for spelling mistakes

SELECT PROD_NAME
FROM transctions 
GROUP BY PROD_NAME;

-- alot of space problem lets fix that 

SELECT
    PROD_NAME AS Before,
    TRIM(REPLACE(REPLACE(REPLACE(PROD_NAME, '  ', ' '), '  ', ' '), '  ', ' ')) AS After
FROM transctions;

UPDATE transctions
    SET PROD_NAME = TRIM(REPLACE(REPLACE(REPLACE(PROD_NAME, '  ', ' '), '  ', ' '), '  ', ' '))


/*i hope its obvious i put 3 REPLACE FUNC inside eachother so that what will happen :
1- every 2 spaces will be 1 space so if we have 8 spaces it will be 4
2- the second replace make those 4 spaces 2 spaces
3- the third replace make it 1 space between everyword, It's a manual method, but we don't need anything complicated here.
4- TRIM FUNC to delete any space in the beginnig or in the end*/


-- step two alot of Inconsistent abbreviations lets fix that 

SELECT DISTINCT PROD_NAME
FROM transctions
ORDER BY PROD_NAME;

-- lets try to find syntex errors

-- The word before & and the word after it both attach to it

UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, '&', ' & ')

-- alot of abbreviations errors

-- Brand abbreviations
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'RRD', 'Red Rock Deli');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'WW', 'Woolworths');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'NCC', 'Natural Chip Company');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'ChipCo', 'Chip Co');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'GrnWves', 'Grain Waves');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Snbts', 'Sunbites');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Infzns', 'Infuzions');

-- Product/ingredient spelling
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chps', 'Chips');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chp', 'Chip');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chs', 'Cheese');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Crm', 'Cream');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Compny', 'Company');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Cheddr', 'Cheddar');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Ched', 'Cheddar');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Mstrd', 'Mustard');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Whlgrn', 'Wholegrain');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Whlegrn', 'Wholegrain');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Tmato', 'Tomato');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chnky', 'Chunky');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Swt', 'Sweet');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chlli', 'Chilli');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chli', 'Chilli');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Sr/Cream', 'Sour Cream');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'S/Cream', 'Sour Cream');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'SourCream', 'Sour Cream');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Hrb', 'Herb');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Spce', 'Spice');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Vingr', 'Vinegar');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Vingar', 'Vinegar');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Vinegr', 'Vinegar');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Jlpno', 'Jalapeno');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Gcamole', 'Guacamole');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Btroot', 'Beetroot');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chutny', 'Chutney');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chikn', 'Chicken');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chckn', 'Chicken');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Hny', 'Honey');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Hony', 'Honey');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Siracha', 'Sriracha');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Mzzrlla', 'Mozzarella');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Crnchers', 'Crunchers');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Slt', 'Salt');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Sthrn', 'Southern');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Frch', 'French');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Onin', 'Onion');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Orgnl', 'Original');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Originl', 'Original');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Spcy', 'Spicy');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Rst', 'Roast');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Crips', 'Crisps');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Veg', 'Vegetable');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Strws', 'Straws');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chimuchurri', 'Chimichurri');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Snag&Sauce', 'Sausage & Sauce');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Pot', 'Potato');
-- Compound splits
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'SeaSalt', 'Sea Salt');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'CutSalt', 'Cut Salt');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'FriedChicken', 'Fried Chicken');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Seasonedchicken', 'Seasoned Chicken');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'SweetChili', 'Sweet Chili');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'PotatoMix', 'Potato Mix');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'OnionDip', 'Onion Dip');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Chicken270g', 'Chicken 270g');
UPDATE transctions SET PROD_NAME = REPLACE(PROD_NAME, 'Ht300g', 'Hot 300g');


-- In the weight number, there are rows ending with G and rows ending with g lets fix that 
UPDATE transctions
SET PROD_NAME = LEFT(PROD_NAME, LEN(PROD_NAME) - 1) + 'g' 
WHERE RIGHT(PROD_NAME, 1) = 'G'


-- finally i can say that data is cleaned 😑

-- lets put them in one table

SELECT p.LYLTY_CARD_NBR,
p.LIFESTAGE,
p.PREMIUM_CUSTOMER,
t.PROD_NAME,
t.PROD_NBR,
t.PROD_QTY,
t.STORE_NBR,
t.TOT_SALES,
t.TXN_ID,
t.DATE
INTO customer_data
FROM transctions t
JOIN purchase p 
ON t.LYLTY_CARD_NBR = p.LYLTY_CARD_NBR
ORDER BY p.LYLTY_CARD_NBR

--After we export the customer data table into an excel file let's go to power bi to complete our work