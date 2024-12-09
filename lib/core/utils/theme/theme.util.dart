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
      primaryContainer: ColorsUtils.grayscale_white_white,
      secondary: ColorsUtils.grayscale_gray_light_gray,
      secondaryContainer: ColorsUtils.grayscale_white_dark_white,
      tertiary: ColorsUtils.grayscale_gray_shaded_gray,
      tertiaryContainer: ColorsUtils.grayscale_gray_tinded_gray,
      surface: ColorsUtils.text_black,
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
      primaryContainer: ColorsUtils.grayscale_black_pale_black,
      secondary: ColorsUtils.grayscale_gray_dark_gray,
      secondaryContainer: ColorsUtils.grayscale_gray_dark_gray,
      tertiary: ColorsUtils.grayscale_white_white,
      tertiaryContainer: ColorsUtils.grayscale_gray_pale_gray,
      surface: ColorsUtils.text_white,
    ),
    textTheme: TextThemeUtils.darkTextTheme,
  );
}
