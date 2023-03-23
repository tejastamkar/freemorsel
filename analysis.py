import pytz
from datetime import timedelta
from datetime import datetime


def getMonthDetails(data):
    sortedData = getDataSort(data)
    # df = sortedData
    week1_df = []
    week2_df = []
    week3_df = []
    week4_df = []

    today = datetime.today()
    week1_start = today - timedelta(weeks=4)
    week1_end = today - timedelta(weeks=3) + timedelta(days=1)
    week2_start = today - timedelta(weeks=3)
    week2_end = today - timedelta(weeks=2) + timedelta(days=1)
    week3_start = today - timedelta(weeks=2)
    week3_end = today - timedelta(weeks=1) + timedelta(days=1)
    week4_start = today - timedelta(weeks=1)
    week4_end = today

    utc = pytz.UTC

    week1_start = utc.localize(week1_start)
    week1_end = utc.localize(week1_end)
    week2_start = utc.localize(week2_start)
    week2_end = utc.localize(week2_end)
    week3_start = utc.localize(week3_start)
    week3_end = utc.localize(week3_end)
    week4_start = utc.localize(week4_start)
    week4_end = utc.localize(week4_end)

    for df in sortedData:
        if df["Time"] >= week1_start and df['Time'] <= week1_end:
            week1_df.append(df)
        elif df["Time"] >= week2_start and df['Time'] <= week2_end:
            week2_df.append(df)
        elif df["Time"] >= week3_start and df['Time'] <= week3_end:
            week3_df.append(df)
        elif df["Time"] >= week4_start and df['Time'] <= week4_end:
            week4_df.append(df)

    w1 = getMap(week1_df, "w1")
    w2 = getMap(week2_df, "w2")
    w3 = getMap(week3_df, "w3")
    w4 = getMap(week4_df, "w4")

    return [w1, w2, w3, w4]


def getMap(dataSet, nameOFaxis: str):
    y1 = 0
    y2 = 0
    x = {
        "x": nameOFaxis,
        "y1": 0,
        "y2": 0
    }
    for data in dataSet:
        if (data["TypeOfDonation"] != "Good"):
            y1 += 1
        else:
            y2 += 1

    x["y1"] = y1
    x["y2"] = y2
    return x
# getMonthDetails()


def getDataSort(donationData):
    sorted_arr = sorted(
        donationData, key=lambda x: x["Time"], reverse=True)
    return sorted_arr
