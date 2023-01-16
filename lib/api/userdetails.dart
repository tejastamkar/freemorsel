import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:freemorsel/api/checkuser.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/provider/notifcationprovider.dart';
import 'package:freemorsel/provider/phoneauth.dart';

class UserDetails {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  userExits({required BuildContext context}) async {
    bool userExit = await checkLogin();
    if (userExit) {
      getFCM(uid: uid);
      await getUserDetails(context: context);
    } else {
      await PhoneAuth().logOut(context: context);
    }
  }

  updateUerDetails(
      {required BuildContext context,
      required int profileSelector,
      required String userName,
      required String email}) async {
    try {
      await FirebaseFirestore.instance.collection("Users").doc(uid).update({
        "username": userName,
        "PhoneNo": phoneNum,
        "email": email,
        "profilePic": profilePicSelector,
        "token": fcmToken,
      });
    } catch (e) {
      PhoneAuth().logOut(context: context);
    }
  }

  getUserDetails({required BuildContext context}) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((docSnapshot) async {
        var data = docSnapshot.data()!;
        username = data["username"];
        phoneNum = data["PhoneNo"];
        email = data["email"];
        level = data["level"];
        points = data["Points"];
        profilePicSelector = data["profilePic"];
      });
    } catch (e) {
      PhoneAuth().logOut(context: context);
    }
  }
}
