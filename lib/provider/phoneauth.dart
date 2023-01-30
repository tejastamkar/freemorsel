import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/checkuser.dart';
import 'package:freemorsel/api/userdetails.dart';
import 'package:freemorsel/screens/login.dart';
import 'package:freemorsel/screens/navbarscreens/narbar.dart';
import 'package:freemorsel/screens/registration.dart';
import 'package:freemorsel/widgets/deletescreen.dart';
import 'package:freemorsel/widgets/otppopup.dart';

class PhoneAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future sendOtp(
      {required String phoneNo,
      required BuildContext context,
      bool resendOtp = false}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNo",
        timeout: const Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          if (resendOtp) {
          } else {
            showDialog(
                context: context,
                builder: (context) => OtpPopup(
                      phoneNumber: phoneNo,
                      verificationId: verificationId,
                    ));
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  reAuth({required String phoneNo, required BuildContext context}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNo",
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => ReAuthPopup(
            verificationId: verificationId,
          ),
        ),
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future reAuthSubmitOtp(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    try {
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential)
          .then((value) async {
        await UserDetails().deleteUserAccount(context: context);
      }).then((value) => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  submitOpt(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(credential).whenComplete(() async {
      if (FirebaseAuth.instance.currentUser == null) {
        logOut(context: context);
        return;
      }
      await checkLogin().then((newUser) {
        if (newUser) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Navbar()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
              (route) => false);
        }
      });
    });
  }

  logOut({required BuildContext context}) {
    auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
