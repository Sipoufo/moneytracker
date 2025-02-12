import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class HiveRegister {
  static void allHivesObjectsRegister() {
    Hive.registerAdapter<SettingThemeModel>(SettingThemeModelAdapter());
    Hive.registerAdapter<SettingUserModel>(SettingUserModelAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<SettingThemeModel>("SettingThemeModel");
    await Hive.openBox<SettingUserModel>("SettingUserModel");
  }

  static void initDependencies() {
    serviceLocator.registerFactory<Box<SettingThemeModel>>(() => Hive.box<SettingThemeModel>("SettingThemeModel"));
    serviceLocator.registerFactory<Box<SettingUserModel>>(() => Hive.box<SettingUserModel>("SettingUserModel"));
  }
}
