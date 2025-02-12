import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/domain/entities/setting_theme_mode.entity.dart';

// Abstract class use to manage theme
abstract interface class SettingThemeRepository {
  /// Use to fetch current theme
  Future<Either<Failure, SettingThemeEntity>> fetchCurrentTheme();

  /// Use to update current theme
  Future<Either<Failure, SettingThemeEntity>> updateCurrentTheme(SettingThemeEntity theme);
}