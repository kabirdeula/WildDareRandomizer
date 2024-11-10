import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/app/app.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColor.kDefaultPrimaryColor,
      secondary: AppColor.kDefaultSecondaryColor,
      surface: AppColor.kDefaultBackgroundColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColor.kDefaultTextColor,
    ),
    primaryColor: AppColor.kDefaultPrimaryColor,
    scaffoldBackgroundColor: AppColor.kDefaultBackgroundColor,
    textTheme: kLightTextTheme,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: kDarkTextTheme,
    // primaryColor: AppColor.kDarkModePrimaryColor,
    // colorScheme: ColorScheme.dark(
    //   primary: AppColor.kDarkModePrimaryColor,
    //   secondary: AppColor.kDarkModeSecondaryColor,
    //   surface: AppColor.kBgPrimaryColor,
    //   onSurface: Colors.white,
    // ),
    // scaffoldBackgroundColor: AppColor.kBgPrimaryColor,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColor.kBackgroundColor,
    //   foregroundColor: AppColor.kDarkModePrimaryColor,
    // ),
  );
}
