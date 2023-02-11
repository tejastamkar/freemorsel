import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:freemorsel/screens/navbarscreens/bottomnavbar.dart';
import 'package:freemorsel/widgets/cards/theme/deftheme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonateSplash extends StatefulWidget {
  const DonateSplash({Key? key}) : super(key: key);

  @override
  State<DonateSplash> createState() => _DonateSplashState();
}

class _DonateSplashState extends State<DonateSplash> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AnimatedSplashScreen(
        splashIconSize: height,
        duration: 1500,
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SvgPicture.asset(
                'assets/icons/done.svg',
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "The driver will",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: primary2Color),
                ),
                Text(
                  "pick up your donation",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: primary2Color),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Keep Donating!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: primary3Color),
                ),
              ],
            ),
          ],
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: const Navbar());
  }
}
