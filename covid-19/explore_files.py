import pandas as pd

files = [
    r"F:\Data Analysis\مشاريع\covid-19\Source Data\Covid-19.xlsx",
    r"F:\Data Analysis\مشاريع\covid-19\Working on Data\Covid_vaccinations.xlsx",
    r"F:\Data Analysis\مشاريع\covid-19\Working on Data\Covid_Deaths.xlsx"
]

for f in files:
    print("=" * 90)
    print(f"FILE: {f}")
    print("=" * 90)
    try:
        xls = pd.ExcelFile(f)
        print(f"Sheets: {xls.sheet_names}")
        for sheet in xls.sheet_names:
            print(f"\n{'#' * 70}")
            print(f"### Sheet: {sheet}")
            print(f"{'#' * 70}")
            df = pd.read_excel(xls, sheet_name=sheet)
            print(f"  Rows: {df.shape[0]}, Cols: {df.shape[1]}")
            print(f"\n  Columns:")
            for c in df.columns:
                print(f"    {str(c):45s} {str(df[c].dtype):15s}  nulls={df[c].isnull().sum()}")
            print(f"\n  First 5 rows:")
            print(df.head().to_string())
            print(f"\n  Summary statistics (numeric columns):")
            num_cols = df.select_dtypes(include="number").columns
            if len(num_cols):
                print(df[num_cols].describe().to_string())
            else:
                print("    (none)")
            print()
    except Exception as e:
        print(f"ERROR: {e}")
    print()
