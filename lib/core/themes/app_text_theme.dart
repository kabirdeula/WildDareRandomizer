import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/core/constants/constants.dart';

/// The 2018 spec has thirteen text styles:
///
/// | NAME           | SIZE |  WEIGHT |  SPACING |             |
/// |----------------|------|---------|----------|-------------|
/// | displayLarge   | 96.0 | light   | -1.5     |             |
/// | displayMedium  | 60.0 | light   | -0.5     |             |
/// | displaySmall   | 48.0 | regular |  0.0     |             |
/// | headlineLarge  | 40.0 | regular |  0.25    |             |
/// | headlineMedium | 34.0 | regular |  0.25    |             |
/// | headlineSmall  | 24.0 | regular |  0.0     |             |
/// | titleLarge     | 20.0 | medium  |  0.15    |             |
/// | titleMedium    | 16.0 | regular |  0.15    |             |
/// | titleSmall     | 14.0 | medium  |  0.1     |             |
/// | bodyLarge      | 16.0 | regular |  0.5     |             |
/// | bodyMedium     | 14.0 | regular |  0.25    |             |
/// | bodySmall      | 12.0 | regular |  0.4     |             |
/// | labelLarge     | 14.0 | medium  |  1.25    |             |
/// | labelSmall     | 10.0 | regular |  1.5     |             |

final TextTheme kLightTextTheme = TextTheme(
  displayLarge: const TextStyle(),
  displayMedium: const TextStyle(),
  displaySmall: TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: 'Poppins',
  ),
  headlineLarge: TextStyle(
    // fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: 'Poppins',
  ),
  headlineMedium: const TextStyle(),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    fontFamily: 'Poppins',
  ),
  titleLarge: const TextStyle(),
  titleMedium: const TextStyle(),
  titleSmall: const TextStyle(),
  bodyLarge: TextStyle(
    color: AppColors.text,
    fontFamily: 'Poppins',
  ),
  bodyMedium: const TextStyle(),
  bodySmall: const TextStyle(),
  labelLarge: const TextStyle(),
  labelSmall: const TextStyle(),
);

final TextTheme kDarkTextTheme = TextTheme(
  displayLarge: const TextStyle(),
  displayMedium: const TextStyle(),
  displaySmall: const TextStyle(),
  headlineLarge: const TextStyle(),
  headlineMedium: const TextStyle(),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
    fontFamily: 'Poppins',
  ),
  titleLarge: const TextStyle(),
  titleMedium: const TextStyle(),
  titleSmall: const TextStyle(),
  bodyLarge: TextStyle(
    color: AppColors.darkText,
    fontFamily: 'Poppins',
  ),
  bodyMedium: const TextStyle(),
  bodySmall: const TextStyle(),
  labelLarge: const TextStyle(),
  labelSmall: const TextStyle(),
);