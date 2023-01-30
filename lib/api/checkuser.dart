import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/provider/notifcationprovider.dart';

Future<bool> checkLogin() async {
  try {
    bool newUser = true;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((docSnapshot) async {
      if (docSnapshot.exists) {
        getFCM(uid: uid);
        newUser = true;
      } else {
        newUser = false;
      }
    });
    return newUser;
  } catch (e) {
    return false;
  }
}

Future newUserLogin() async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  fcmToken = (await FirebaseMessaging.instance.getToken())!;
  FirebaseFirestore.instance.collection("Users").doc(uid).set({
    "userId": uid,
    "username": username,
    "PhoneNo": phoneNum,
    "email": email,
    "noOfDonation": 0,
    "profilePic": profilePicSelector,
    "Points": 0,
    "level": 0,
    "token": fcmToken,
    "notifiacation": false,
    "offernotification": false,
    "drivecampnotification": false
  });
}
