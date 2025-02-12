import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/data/models/setting_theme.model.dart';

class SettingThemeEntity {
  final ThemeMode themeMode;

  const SettingThemeEntity({
    required this.themeMode,
  });

  factory SettingThemeEntity.map(SettingThemeModel theme) {
    return SettingThemeEntity(themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light);
  }
}