import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 20,
        selectedLabelStyle:
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: mainColor),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: mainColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: mainColor, fontSize: 25, fontWeight: FontWeight.bold)),
    primarySwatch: mainColor,
    primaryColor: mainColor);

ThemeData dark = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color.fromARGB(255, 255, 255, 255))),
  scaffoldBackgroundColor: const Color.fromARGB(92, 92, 90, 90),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      backgroundColor: Color.fromARGB(92, 92, 90, 90),
      elevation: 20,
      selectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor),
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: mainColor,
      ),
      backgroundColor: Color.fromARGB(92, 92, 90, 90),
      elevation: 0,
      titleTextStyle: TextStyle(
          color: mainColor, fontSize: 25, fontWeight: FontWeight.bold)),
  primarySwatch: mainColor,
);
