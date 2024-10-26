import 'package:flutter/material.dart';

class AppTheme {
  static const Color kLightPrimaryColor = Color(0xFF7E60BF);
  static const Color kLightSecondaryColor = Color(0xFF387478);
  static const Color kLightBackgroundColor = Color(0xFFF8F9FA);

  static const Color kDarkPrimaryColor = Color(0xFF433878);
  static const Color kDarkSecondaryColor = Color(0xFF243642);
  static const Color kDarkBackgroundColor = Color(0xFF121212);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: kLightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: kLightPrimaryColor,
      secondary: kLightSecondaryColor,
      surface: kLightBackgroundColor,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: kLightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kLightPrimaryColor,
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: kDarkPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: kDarkPrimaryColor,
      secondary: kDarkSecondaryColor,
      surface: kDarkBackgroundColor,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: kDarkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkPrimaryColor,
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.dark,
  );
}
