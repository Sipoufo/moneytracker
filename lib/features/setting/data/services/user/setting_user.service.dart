import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';

// Abstract class use to manage theme
abstract  interface class SettingUserService {
  /// Use to fetch current theme
  SettingUserModel? fetchCurrentUser();

  /// Use to update current theme
  SettingUserModel saveCurrentUser(SettingUserModel user);
}