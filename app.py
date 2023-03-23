from flask import Flask, request
from analysis import getMonthDetails
from rank import getRank, MyRank
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from datetime import timedelta
from datetime import datetime

cred = credentials.Certificate("./serviceAccountKey.json")
firebase_admin.initialize_app(cred)


app = Flask(__name__)
app.config["DEBUG"] = True

db = firestore.client()


@app.route("/")
def home():
    return f"/rank , /myrank , /getanalysis"


@app.route("/rank")
def getrank():
    userData = []
    docsnap = db.collection('Users').where(u'Points', u'>=', 10).get()
    for doc in docsnap:
        userData.append(doc.to_dict())
    myresults = getRank(userData)
    return myresults[0:3]


@app.route("/myrank")
def getMyRank():
    userid = request.form['uid']
    userData = []
    docsnap = db.collection('Users').get()
    for doc in docsnap:
        userData.append(doc.to_dict())
    sortedList = getRank(userData)
    myresults = MyRank(sortedList, userid)
    return f"{myresults +1}"


@app.route("/getanalysis")
def getAnalysis():
    # userid = request.form['uid']
    date = datetime.today() - timedelta(weeks=4)
    donationData = []
    docsnap = db.collection('Donation').where(u'Time', u'>=', date).get()
    for doc in docsnap:
        donationData.append(doc.to_dict())
    # print(donationData)
    sortedList = getMonthDetails(donationData)
    # myresults = MyRank(sortedList, userid)
    return sortedList


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
