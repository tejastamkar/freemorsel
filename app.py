from flask import Flask, request
from rank import getRank, MyRank
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

cred = credentials.Certificate("./serviceAccountKey.json")
firebase_admin.initialize_app(cred)


app = Flask(__name__)
app.config["DEBUG"] = True

db = firestore.client()


@app.route("/rank")
def getrank():
    userData = []
    docsnap = db.collection('Users').get()
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
    return f"{myresults}"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
