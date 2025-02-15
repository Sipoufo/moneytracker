import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneytracker/features/setting/domain/entities/theme/setting_theme.entity.dart';

part 'setting_theme.model.g.dart';

/// Use to manage the state across the app
@HiveType(typeId: 01)
class SettingThemeModel {
  @HiveField(00)
  final int id;

  @HiveField(02)
  final bool isDark;

  const SettingThemeModel({
    required this.id,
    required this.isDark,
  });

  factory SettingThemeModel.map(SettingThemeEntity theme) {
    return SettingThemeModel(
      id: 0,
      isDark: (theme.themeMode == ThemeMode.dark ? true : false),
    );
  }
}
