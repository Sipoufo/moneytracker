import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/theme/setting_theme.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/theme/setting_theme.repository.dart';

class SettingFetchCurrentThemeUseCase implements UseCase<SettingThemeEntity, NoParams> {
  final SettingThemeRepository settingThemeRepository;

  SettingFetchCurrentThemeUseCase(this.settingThemeRepository);

  @override
  Future<Either<Failure, SettingThemeEntity>> call(NoParams params) async {
    return await settingThemeRepository.fetchCurrentTheme();
  }
}