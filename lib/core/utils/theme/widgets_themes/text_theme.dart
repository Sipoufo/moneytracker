import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/typography.util.dart';

/// Custom Class for Light & Dark Text Themes
class TextThemeUtils {
  TextThemeUtils._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TypographiesUtils.heading_2.copyWith(color: ColorsUtils.text_white),
    headlineMedium: TypographiesUtils.heading_4.copyWith(color: ColorsUtils.text_white),
    headlineSmall: TypographiesUtils.heading_7.copyWith(color: ColorsUtils.text_white),

    titleLarge: TypographiesUtils.subhead_1.copyWith(color: ColorsUtils.text_white),
    titleMedium: TypographiesUtils.subhead_2.copyWith(color: ColorsUtils.text_white),
    titleSmall: TypographiesUtils.subhead_3.copyWith(color: ColorsUtils.text_white),

    bodyLarge: TypographiesUtils.body_1.copyWith(color: ColorsUtils.text_white),
    bodyMedium: TypographiesUtils.body_2.copyWith(color: ColorsUtils.text_white),
    bodySmall: TypographiesUtils.body_3.copyWith(color: ColorsUtils.text_white),

    displayLarge: TypographiesUtils.body_4.copyWith(color: ColorsUtils.text_white),
  );

  /// Customizable Dark Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TypographiesUtils.heading_2.copyWith(color: ColorsUtils.text_black),
    headlineMedium: TypographiesUtils.heading_4.copyWith(color: ColorsUtils.text_black),
    headlineSmall: TypographiesUtils.heading_7.copyWith(color: ColorsUtils.text_black),

    titleLarge: TypographiesUtils.subhead_1.copyWith(color: ColorsUtils.text_black),
    titleMedium: TypographiesUtils.subhead_2.copyWith(color: ColorsUtils.text_black),
    titleSmall: TypographiesUtils.subhead_3.copyWith(color: ColorsUtils.text_black),

    bodyLarge: TypographiesUtils.body_1.copyWith(color: ColorsUtils.text_black),
    bodyMedium: TypographiesUtils.body_2.copyWith(color: ColorsUtils.text_black),
    bodySmall: TypographiesUtils.body_3.copyWith(color: ColorsUtils.text_black),

    displayLarge: TypographiesUtils.body_4.copyWith(color: ColorsUtils.text_black),
  );
}
