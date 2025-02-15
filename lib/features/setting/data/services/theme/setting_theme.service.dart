import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';

// Abstract class use to manage theme
abstract  interface class SettingThemeService {
  /// Use to fetch current theme
  SettingThemeModel fetchCurrentTheme();

  /// Use to update current theme
  Future<SettingThemeModel> updateCurrentTheme(SettingThemeModel theme);
}