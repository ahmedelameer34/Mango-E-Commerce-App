import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData light = ThemeData(
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black)),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20,
      selectedLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
);
ThemeData dark = ThemeData(
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

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.cyan,
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: mainColor,
  onPrimaryContainer: Color(0xFF002021),
  secondary: Color(0xFF4A6364),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCE8E8),
  onSecondaryContainer: Color(0xFF041F20),
  tertiary: Color(0xFF4D5F7C),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD5E3FF),
  onTertiaryContainer: Color(0xFF071C36),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFC),
  onBackground: Color(0xFF191C1C),
  surface: Color(0xFFFAFDFC),
  onSurface: Color(0xFF191C1C),
  surfaceVariant: Color(0xFFDAE4E4),
  onSurfaceVariant: Color(0xFF3F4949),
  outline: Color(0xFF6F7979),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4CD9DE),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF00696C),
  outlineVariant: Color(0xFFBEC8C8),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.cyan,
  onPrimary: Color(0xFF003738),
  primaryContainer: Color(0xFF004F52),
  onPrimaryContainer: mainColor,
  secondary: Color(0xFFB0CCCC),
  onSecondary: Color(0xFF1B3435),
  secondaryContainer: Color(0xFF324B4C),
  onSecondaryContainer: Color(0xFFCCE8E8),
  tertiary: Color(0xFFB5C7E9),
  onTertiary: Color(0xFF1E314C),
  tertiaryContainer: Color(0xFF354763),
  onTertiaryContainer: Color(0xFFD5E3FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1C),
  onBackground: Color(0xFFE0E3E2),
  surface: Color(0xFF191C1C),
  onSurface: Color(0xFFE0E3E2),
  surfaceVariant: Color(0xFF3F4949),
  onSurfaceVariant: Color(0xFFBEC8C8),
  outline: Color(0xFF899393),
  onInverseSurface: Color(0xFF191C1C),
  inverseSurface: Color(0xFFE0E3E2),
  inversePrimary: Color(0xFF00696C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4CD9DE),
  outlineVariant: Color(0xFF3F4949),
  scrim: Color(0xFF000000),
);
