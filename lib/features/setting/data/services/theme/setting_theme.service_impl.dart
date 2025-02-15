import 'package:flutter/material.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';

// Abstract class use to manage theme
class SettingThemeServiceImpl implements SettingThemeService {
  final LocalDataService<SettingThemeModel> localDataService;

  SettingThemeServiceImpl(this.localDataService);

  /// Use to fetch current theme
  @override
  SettingThemeModel fetchCurrentTheme() {
    List<SettingThemeModel> currentTheme = localDataService.loadData();

    // If no theme is find, we save the system theme for default theme
    if (currentTheme.isEmpty) {
      SettingThemeModel systemTheme = const SettingThemeModel(
        id: 0,
        isDark: (ThemeMode.system == ThemeMode.dark ? true : false),
      );
      updateCurrentTheme(SettingThemeModel(id: systemTheme.id, isDark: systemTheme.isDark));
      return SettingThemeModel(id: systemTheme.id, isDark: systemTheme.isDark);
    }

    // Check if theme is save
    return currentTheme[0];
  }

  /// Use to update current theme
  @override
  SettingThemeModel updateCurrentTheme(SettingThemeModel theme) {
    localDataService.updateLocalData(id: theme.id, data: theme);
    return theme;
  }
}
