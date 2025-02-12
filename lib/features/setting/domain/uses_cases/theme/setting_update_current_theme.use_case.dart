import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/setting_theme_mode.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/theme/setting_theme.repository.dart';

class SettingUpdateCurrentThemeUseCase implements UseCase<SettingThemeEntity, SettingUpdateCurrentThemeParam> {
  final SettingThemeRepository settingThemeRepository;

  SettingUpdateCurrentThemeUseCase(this.settingThemeRepository);

  @override
  Future<Either<Failure, SettingThemeEntity>> call(SettingUpdateCurrentThemeParam params) async {
    return await settingThemeRepository.updateCurrentTheme(params.theme);
  }
}

class SettingUpdateCurrentThemeParam {
  final SettingThemeEntity theme;

  const SettingUpdateCurrentThemeParam(this.theme);
}