import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/domain/entities/theme/setting_theme.entity.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

// Abstract class use to manage theme
abstract interface class SettingUserRepository {
  /// Use to fetch current theme
  Future<Either<Failure, SettingUserEntity?>> fetchCurrentUser();

  /// Use to update current theme
  Future<Either<Failure, SettingUserEntity>> saveCurrentUser(SettingUserEntity user);
}