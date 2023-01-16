import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/checkuser.dart';
import 'package:freemorsel/screens/login.dart';
import 'package:freemorsel/screens/navbarscreens/narbar.dart';
import 'package:freemorsel/screens/registration.dart';
import 'package:freemorsel/widgets/otppopup.dart';

class PhoneAuth {
  FirebaseAuth auth = FirebaseAuth.instance;
  sendOtp({required String phoneNo, required BuildContext context}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNo",
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) => showDialog(
          context: context,
          builder: (context) => OtpPopup(
                phoneNumber: phoneNo,
                verificationId: verificationId,
              )),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  submitOpt(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await auth.signInWithCredential(credential);
    bool newUser = await checkLogin();
    if (newUser) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Navbar()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const RegisterScreen()),
          (route) => false);
    }
  }

  logOut({required BuildContext context}) {
    auth.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
