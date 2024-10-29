import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/app/app.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.kLightPrimaryColor,
    colorScheme: ColorScheme.light(
      primary: AppColor.kLightPrimaryColor,
      secondary: AppColor.kLightSecondaryColor,
      surface: AppColor.kBgPrimaryColor,
      onSurface: AppColor.kBgSecondaryColor,
    ),
    scaffoldBackgroundColor: AppColor.kBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kBackgroundColor,
      foregroundColor: AppColor.kLightPrimaryColor,
    ),
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.kDarkModePrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: AppColor.kDarkModePrimaryColor,
      secondary: AppColor.kDarkModeSecondaryColor,
      surface: AppColor.kBgPrimaryColor,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: AppColor.kBgPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.kBackgroundColor,
      foregroundColor: AppColor.kDarkModePrimaryColor,
    ),
    brightness: Brightness.dark,
  );
}
