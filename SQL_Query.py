from pathlib import Path

import duckdb
import pandas as pd

project_dir = Path(__file__).resolve().parent

csv_path = project_dir / "CMS_midwest_data.csv"
sql1_path = project_dir / "SQL-V1" / "Question1.sql"
sql2_path = project_dir / "SQL-V1" / "Question2.sql"
sql3_path = project_dir / "SQL-V1" / "Question3.sql"

query1 = sql1_path.read_text(encoding="utf-8")
query2 = sql2_path.read_text(encoding="utf-8")
query3 = sql3_path.read_text(encoding="utf-8")

def V1_Question(csv_path, query):     #Question Calling from SQL folder
    with duckdb.connect() as con:
        con.read_csv(str(csv_path)).create_view("CMS_midwest_data")
        result: pd.DataFrame = con.execute(query).df()

    print(result.head())
    print(f"Rows returned: {len(result)}")

V1_Question(csv_path, query1)