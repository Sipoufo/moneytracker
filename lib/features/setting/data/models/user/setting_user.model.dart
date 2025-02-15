import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

part 'setting_user.model.g.dart';

/// Use to manage the state across the app
@HiveType(typeId: 02)
class SettingUserModel {
  @HiveField(00)
  final int id;

  @HiveField(01)
  final String fullName;

  @HiveField(02)
  final String userName;

  @HiveField(03)
  final String email;

  const SettingUserModel({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
  });

  factory SettingUserModel.map(SettingUserEntity userEntity) {
    return SettingUserModel(
        id: userEntity.id,
        fullName: userEntity.fullName,
        userName: userEntity.userName,
        email: userEntity.email,
    );
  }
}