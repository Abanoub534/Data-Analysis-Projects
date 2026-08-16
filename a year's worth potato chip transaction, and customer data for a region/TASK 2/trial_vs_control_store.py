import pandas as pd
import openpyxl

file_path = r"F:\serches\store_customer_monthly_data.csv"
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()

df['MONTH_END'] = pd.to_datetime(df['MONTH_END'])

store_monthly = (
    df.groupby(["STORE_NBR", "MONTH_END"])
    .agg(
    num_of_cust = ("LYLTY_CARD_NBR", "nunique"),
    tot_sales = ("TOT_SALES_PER_MONTH", "sum"),
    num_of_txn = ("TXN_COUNT", "sum")
    
)
    .reset_index())


store_monthly["N_TXN_PER_CUST"] = store_monthly["num_of_txn"] / store_monthly["num_of_cust"]
store_monthly.to_excel(r"F:\Data Analysis\مشاريع\a year's worth potato chip transaction, and customer data for a region\TASK 2\store_monthly.xlsx", index=False)

pre_trial = store_monthly[
        (store_monthly["MONTH_END"] >= "2018-07-31") &
        ((store_monthly["MONTH_END"] <= "2019-01-31"))
]

post_trial = store_monthly[
        (store_monthly["MONTH_END"] >= "2019-02-28") &
        ((store_monthly["MONTH_END"] <= "2019-06-30"))
]

def calc_pearson(data, trial_store):
    trial_data = data[data["STORE_NBR"] == trial_store]
    
    all_stores = data["STORE_NBR"].unique()
    
    results = []
    
    for store in all_stores:
        if store == trial_store:
            continue
        
        comparison_data = data[data["STORE_NBR"] == store]
        if comparison_data["MONTH_END"].nunique() != trial_data["MONTH_END"].nunique():
            continue
        
        merged = trial_data.merge(comparison_data, on="MONTH_END")
        
        if (merged["num_of_cust_y"].std() > 0 and 
            merged["tot_sales_y"].std() > 0 and 
            merged["N_TXN_PER_CUST_y"].std() > 0):
                num_of_cust_corr = merged["num_of_cust_x"].corr(merged["num_of_cust_y"])
                tot_sales_corr = merged["tot_sales_x"].corr(merged["tot_sales_y"])
                N_TXN_PER_CUST_corr = merged["N_TXN_PER_CUST_x"].corr(merged["N_TXN_PER_CUST_y"])
                score = (num_of_cust_corr + tot_sales_corr + N_TXN_PER_CUST_corr) /3 
                results.append((store, num_of_cust_corr, tot_sales_corr, N_TXN_PER_CUST_corr, score))
            
    results = pd.DataFrame(results, columns=["STORE_NBR", "num_of_cust_corr", "tot_sales_corr", "N_TXN_PER_CUST_corr", "CORR_SCORE"])
    corr_score = results[["STORE_NBR", "CORR_SCORE"]].copy()
    corr_score["CORR_SCORE"] = ( corr_score["CORR_SCORE"] + 1) / 2
    return corr_score.sort_values(by= "CORR_SCORE", ascending= False)

def calc_magnitude(data, trial_store):
    trial_data = data[data["STORE_NBR"] == trial_store]
    trial_months = trial_data["MONTH_END"].nunique()
    
    all_stores = data["STORE_NBR"].unique()
    
    results = []
    
    for store in all_stores:
        if store == trial_store:
            continue
        comparison_data = data[data["STORE_NBR"] == store]
        if comparison_data["MONTH_END"].nunique() != trial_data["MONTH_END"].nunique():
            continue
        merged = trial_data.merge(comparison_data, on="MONTH_END")
        if (merged["num_of_cust_y"].std() > 0 and 
            merged["tot_sales_y"].std() > 0 and 
            merged["N_TXN_PER_CUST_y"].std() > 0):
                dist_n_cust = abs(merged["num_of_cust_x"] - merged["num_of_cust_y"]).mean()
                
                dist_tot_sales = abs(merged["tot_sales_x"] - merged["tot_sales_y"]).mean()
                dist_of_txn_per_cust = abs(merged["N_TXN_PER_CUST_x"] - merged["N_TXN_PER_CUST_y"]).mean()
                results.append((store, dist_n_cust, dist_tot_sales, dist_of_txn_per_cust))
                      
    results = pd.DataFrame(results, columns=["STORE_NBR", "DIST_N_CUST", "DIST_TOT_SALES", "DIST_OF_TXN_PER_CUST"])
    
    results["N_CUST_MAG"] = 1 - (results["DIST_N_CUST"] / results["DIST_N_CUST"].max())
    results["TOTAL_SALES"] = 1 - (results["DIST_TOT_SALES"] / results["DIST_TOT_SALES"].max())
    results["N_TXN_PER_CUST"] = 1 - (results["DIST_OF_TXN_PER_CUST"] / results["DIST_OF_TXN_PER_CUST"].max())
    results["MAG_SCORE"] = (results["N_CUST_MAG"] + results["TOTAL_SALES"] + results["N_TXN_PER_CUST"]) / 3
                
    mag_score = results[["STORE_NBR", "MAG_SCORE"]].sort_values(by="MAG_SCORE", ascending=False)
    return mag_score

def find_control_store(data, trial_store):
    CALC_PERSON = calc_pearson(data, trial_store)
    CALC_MAGNITUDE = calc_magnitude(data, trial_store)
    
    final_score = CALC_PERSON.merge(CALC_MAGNITUDE, on="STORE_NBR")
    
    final_score["FINAL_SCORE"] = (final_score["CORR_SCORE"] + final_score["MAG_SCORE"]) / 2
    return final_score.sort_values("FINAL_SCORE", ascending=False)
    
    
    
print(find_control_store(pre_trial, 77)) #17

print(find_control_store(pre_trial, 86)) #138

print(find_control_store(pre_trial, 88)) #201