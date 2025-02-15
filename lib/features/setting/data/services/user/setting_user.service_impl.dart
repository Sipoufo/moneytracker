import 'package:flutter/material.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';
import 'package:moneytracker/features/setting/data/services/user/setting_user.service.dart';

// Abstract class use to manage user
class SettingUserServiceImpl implements SettingUserService {
  final LocalDataService<SettingUserModel> localDataService;

  SettingUserServiceImpl(this.localDataService);

  /// return current user if it's already save
  @override
  SettingUserModel? fetchCurrentUser() {
    List<SettingUserModel> currentUser = localDataService.loadData();

    // If no user is find, we save the current information
    if (currentUser.isEmpty) {
      return null;
    }

    // Check if theme is save
    return currentUser[0];
  }

  /// Use to update current user
  @override
  Future<SettingUserModel> saveCurrentUser(SettingUserModel user) async {
    localDataService.updateLocalData(id: user.id, data: user);
    final prefs = await InitValuesUtil.sharedPreferences;
    await prefs.setString("username", user.userName);
    return user;
  }
}
