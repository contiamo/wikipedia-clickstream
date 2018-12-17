import pandas as pd


curr = pd.read_parquet('curr.parquet')


def handle(st):
    df = curr.loc[curr['curr'] == st]
    if df.empty:
        raise ValueError("Page {} not found in data.".format(st))
    print(df['prev'].tolist()[0])
