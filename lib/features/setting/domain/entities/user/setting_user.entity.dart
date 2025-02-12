import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';

class SettingUserEntity {
  final String id;
  final String fullName;
  final String userName;
  final String email;

  const SettingUserEntity({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
  });

  factory SettingUserEntity.map(SettingUserModel user) {
    return SettingUserEntity(
        id: user.id,
        fullName: user.fullName,
        userName: user.userName,
        email: user.email,
    );
  }
}