import 'package:flutter/material.dart';

Color primaryColor = const Color.fromRGBO(206, 186, 186, 84);
Color primary2Color = const Color(0xFF75B79E);
Color primary3Color = const Color(0xFF6A8CAF);
Color secondaryColor = const Color.fromRGBO(106, 140, 175, 0.25);
Color headerBg = Colors.white;
Color backgroundColors = Colors.white;
Color cardBg = const Color.fromRGBO(243, 139, 117, 0.6);

ThemeData ligthTheme = ThemeData(
  fontFamily: "Overpass",
  primaryColor: primary3Color,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
      headlineLarge:
          TextStyle(color: Colors.black, fontSize: 28, fontFamily: "Overpass")),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, foregroundColor: Colors.black),
  // primary: primary3Color,
  // appBarStyle: AppB(),
  // secondaryContainer: primary2Color,
  // scaffoldBackground: Colors.white,
  // appBarBackground: Colors.white,
);
ThemeData darkTheme = ThemeData(
  fontFamily: "Overpass",
  primaryColor: primary3Color,
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
      headlineLarge:
          TextStyle(color: Colors.white, fontSize: 28, fontFamily: "Overpass")),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black, foregroundColor: Colors.white),

  // primary: primary3Color,
  // appBarStyle: AppB(),
  // secondaryContainer: primary2Color,
  // scaffoldBackground: Colors.white,
  // appBarBackground: Colors.white,
);
