import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/features/setting/data/services/user/setting_user.service.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/user/setting_user.repository.dart';

class SettingUserRepositoryImpl implements SettingUserRepository {
  final SettingUserService settingUserService;

  SettingUserRepositoryImpl(this.settingUserService);

  @override
  Future<Either<Failure, SettingUserEntity?>> fetchCurrentUser() async {
    try {
      SettingUserModel? user = settingUserService.fetchCurrentUser();
      if(user == null) {
        return const Right(null);
      }
      return right(SettingUserEntity.map(user));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingUserEntity>> saveCurrentUser(SettingUserEntity user) async {
    try {
      return right(SettingUserEntity.map(await settingUserService.saveCurrentUser(SettingUserModel.map(user))));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}