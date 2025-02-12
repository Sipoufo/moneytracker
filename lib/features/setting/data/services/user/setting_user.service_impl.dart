import 'package:flutter/material.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';
import 'package:moneytracker/features/setting/data/services/user/setting_user.service.dart';

// Abstract class use to manage theme
class SettingUserServiceImpl implements SettingUserService {
  final LocalDataService<SettingUserModel> localDataService;

  SettingUserServiceImpl(this.localDataService);

  /// Use to fetch current user
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
  SettingUserModel saveCurrentUser(SettingUserModel user) {
    localDataService.updateLocalData(id: user.id, data: user);
    return user;
  }
}
