import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';

// Abstract class use to manage user
abstract  interface class SettingUserService {
  /// Use to fetch current user
  SettingUserModel? fetchCurrentUser();

  /// Use to save current user
  Future<SettingUserModel> saveCurrentUser(SettingUserModel user);
}