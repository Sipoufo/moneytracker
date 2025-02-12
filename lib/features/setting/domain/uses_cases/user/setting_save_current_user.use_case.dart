import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/user/setting_user.repository.dart';

class SettingSaveCurrentUserUseCase implements UseCase<SettingUserEntity, SettingUpdateCurrentUserParam> {
  final SettingUserRepository settingUserRepository;

  SettingSaveCurrentUserUseCase(this.settingUserRepository);

  @override
  Future<Either<Failure, SettingUserEntity>> call(SettingUpdateCurrentUserParam params) async {
    return await settingUserRepository.saveCurrentUser(params.user);
  }
}

class SettingUpdateCurrentUserParam {
  final SettingUserEntity user;

  const SettingUpdateCurrentUserParam(this.user);
}