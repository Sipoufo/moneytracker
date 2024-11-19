import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/theme/widgets_themes/text_theme.dart';

class ThemeUtil {
  // Light theme
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'PlusJakartaSans',
    colorScheme: const ColorScheme.light(
      primary: ColorsUtils.grayscale_white_white,
      secondary: ColorsUtils.grayscale_gray_light_gray,
    ),
    textTheme: TextThemeUtils.lightTextTheme,
  );

  // Dark theme
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'PlusJakartaSans',
    colorScheme: const ColorScheme.dark(
      primary: ColorsUtils.grayscale_black_light_black,
      secondary: ColorsUtils.grayscale_gray_dark_gray,
    ),
    textTheme: TextThemeUtils.darkTextTheme,
  );
}
