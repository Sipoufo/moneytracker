import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/user/setting_user.repository.dart';

class SettingFetchCurrentUserUseCase implements UseCase<SettingUserEntity?, NoParams> {
  final SettingUserRepository settingUserRepository;

  SettingFetchCurrentUserUseCase(this.settingUserRepository);

  @override
  Future<Either<Failure, SettingUserEntity?>> call(NoParams params) async {
    return await settingUserRepository.fetchCurrentUser();
  }
}