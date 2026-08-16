/* We need to prepare a table containing sales revenue,
the number of customers,
and the number of transactions,
with the data categorized by store, customer, and date.
Finally, we will exclude stores that had months with no sales.*/

SELECT *
FROM QVI_data;

WITH customer_date_level_data AS(
SELECT STORE_NBR,
LYLTY_CARD_NBR,
EOMONTH(DATE) AS MONTH_END,
SUM(TRY_CAST(TOT_SALES AS decimal(18,2))) AS TOT_SALES_PER_MONTH,
COUNT(TXN_ID) AS TXN_COUNT

FROM QVI_data
GROUP BY EOMONTH(DATE),STORE_NBR, LYLTY_CARD_NBR
)
SELECT * 
FROM customer_date_level_data
WHERE TOT_SALES_PER_MONTH > 0
ORDER BY STORE_NBR, MONTH_END;