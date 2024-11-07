import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/colors.util.dart';

class ThemeUtil {
  // Light theme
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'PlusJakartaSans',
    primaryColor: ColorsUtils.grayscale_black_light_black,
  );

  // Dark theme
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'PlusJakartaSans',
    primaryColor: ColorsUtils.grayscale_white_white,
  );
}
