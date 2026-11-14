import pandas as pd
import os

def load_data():
    py_path = os.getcwd()
    CMS_path = os.path.join(py_path, 'CMS.CSV')

    CMS_Data = pd.read_csv(CMS_path, encoding='utf-8')
    return CMS_Data

CMS_data = load_data()

def initial_data(data):
    #Data report
    data_report = {
        "columns": data.columns.tolist(),
        "shape": data.shape,
        "missing_values": data.isnull().sum().to_dict(),
        "duplicates": data.duplicated().sum()
    }
    #Copy to preserve original data
    data_copy = data.copy(deep=True)
    #Basic cleaning
    data_copy.dropna(inplace=True)
    data_copy.drop_duplicates(inplace=True)

    data_copy.columns = (
        data_copy.columns
        .str.lower()
        .str.strip()
        .str.replace(" ", "_")
    )
    #Adding to data report with cleaned data
    data_report["cleaned_columns"] = data_copy.columns.tolist()
    data_report['cleaned_shape'] = data_copy.shape
    data_report['cleaned_missing_values'] = data_copy.isnull().sum().to_dict()
    data_report['cleaned_duplicates'] = data_copy.duplicated().sum()

    return data_copy, data_report

CMS_data_cleaned, CMS_data_report = initial_data(CMS_data)

CMS_data_cleaned = CMS_data_cleaned.to_csv('CMS_data_cleaned.csv', index=False)

