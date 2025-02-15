import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';
import 'package:moneytracker/features/setting/domain/entities/theme/setting_theme.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/theme/setting_theme.repository.dart';

class SettingThemeRepositoryImpl implements SettingThemeRepository {
  final SettingThemeService settingThemeService;

  SettingThemeRepositoryImpl(this.settingThemeService);

  @override
  Future<Either<Failure, SettingThemeEntity>> fetchCurrentTheme() async {
    try {
      return right(SettingThemeEntity.map(settingThemeService.fetchCurrentTheme()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingThemeEntity>> updateCurrentTheme(SettingThemeEntity theme) async {
    try {
      return right(SettingThemeEntity.map(await settingThemeService.updateCurrentTheme(SettingThemeModel.map(theme))));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}