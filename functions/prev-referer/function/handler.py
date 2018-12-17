import pandas as pd


prev = pd.read_parquet('prev.parquet')


def handle(st):
    df = prev.loc[prev['prev'] == st]
    if df.empty:
        raise ValueError("Page {} not found in data.".format(st))
    print(df['curr'].tolist()[0])
