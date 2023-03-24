import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/api/getuserdetails_api.dart';
import 'package:freemorsel/screens/login.dart';
import 'package:freemorsel/screens/navbarscreens/bottomnavbar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    if (auth.currentUser != null) {
      getUserDeatilsApi();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(
        duration: 1500,
        splash: SizedBox(
          width: width / 2,
          height: width / 2,
          child: SvgPicture.asset(
            "assets/icons/logo.svg",
            fit: BoxFit.cover,
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen:
            auth.currentUser == null ? const LoginScreen() : const Navbar());
  }
}
