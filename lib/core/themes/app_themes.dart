import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/core/constants/constants.dart';

import 'themes.dart';

class AppThemes {
  static ThemeData themeData() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: AppColors.text,
      ),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: kLightTextTheme,
      useMaterial3: true,
    );
  }
}
/*

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: kDarkTextTheme,
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
  );
  */
