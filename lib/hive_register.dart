import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/features/setting/data/models/setting_theme.model.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class HiveRegister {
  static void allHivesObjectsRegister() {
    Hive.registerAdapter<SettingThemeModel>(SettingThemeModelAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<SettingThemeModel>("SettingThemeModel");
  }

  static void initDependencies() {
    serviceLocator
      .registerFactory<Box<SettingThemeModel>>(
            () => Hive.box<SettingThemeModel>("SettingThemeModel"),
      );
  }
}