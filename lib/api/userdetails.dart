import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freemorsel/data/userdata.dart';
import 'package:freemorsel/provider/phoneauth.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';

class UserDetails {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  // userExits({required BuildContext context}) async {
  //   await checkLogin().then((userExit) async {
  //     if (userExit) {
  //       getFCM(uid: uid);
  //       await getUserDetails(context: context);
  //     } else {
  //       await PhoneAuth().logOut(context: context);
  //     }
  //   });
  // }

  Future updateUerDetails(
      {required BuildContext context,
      required int profileSelector,
      required String userName,
      required String email}) async {
    await FirebaseFirestore.instance.collection("Users").doc(uid).update({
      "username": userName,
      "PhoneNo": phoneNum,
      "email": email,
      "profilePic": profilePicSelector,
      "token": fcmToken,
    }).catchError((e) {
      log(e.toString());
      PhoneAuth().logOut(context: context);
    });
  }

  Future deleteUserAccount({required BuildContext context}) async {
    try {
      await firebaseStore
          .collection("Users")
          .doc(uid)
          .get()
          .then((value) => value.reference.delete());
      // await FirebaseAuth.instance.currentUser!.delete();
      Fluttertoast.showToast(
          msg: "User Deleted",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          fontSize: 20,
          backgroundColor: primaryColor,
          textColor: Colors.white);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something Went Wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          fontSize: 20,
          backgroundColor: primaryColor,
          textColor: Colors.white);
    }
  }

  Future getUserDetails(
      {required DocumentSnapshot<Map<String, dynamic>> docSnapshot}) async {
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      var data = docSnapshot.data()!;
      username = data["username"];
      phoneNum = data["PhoneNo"];
      email = data["email"];
      level = data["level"];
      points = data["Points"];
      profilePicSelector = data["profilePic"];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      FirebaseAuth.instance.signOut();
    }
  }
}
