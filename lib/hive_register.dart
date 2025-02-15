import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/utils/models/category.model.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/core/utils/models/currency.model.dart';
import 'package:moneytracker/core/utils/models/flag.model.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class HiveRegister {
  static void allHivesObjectsRegister() {
    Hive.registerAdapter<SettingThemeModel>(SettingThemeModelAdapter());
    Hive.registerAdapter<SettingUserModel>(SettingUserModelAdapter());
    Hive.registerAdapter<SettingWalletModel>(SettingWalletModelAdapter());
    Hive.registerAdapter<CountryInfos>(CountryInfosAdapter());
    Hive.registerAdapter<FlagModel>(FlagModelAdapter());
    Hive.registerAdapter<CurrencyModel>(CurrencyModelAdapter());
    Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
    Hive.registerAdapter<BudgetModel>(BudgetModelAdapter());
  }

  static Future<void> openAllBoxes() async {
    await Hive.openBox<SettingThemeModel>("SettingThemeModel");
    await Hive.openBox<SettingUserModel>("SettingUserModel");
    await Hive.openBox<SettingWalletModel>("SettingWalletModel");
    await Hive.openBox<CountryInfos>("CountryInfos");
    await Hive.openBox<FlagModel>("FlagModel");
    await Hive.openBox<CurrencyModel>("CurrencyModel");
    await Hive.openBox<CategoryModel>("CategoryModel");
    await Hive.openBox<BudgetModel>("BudgetModel");
  }

  static void initDependencies() {
    serviceLocator.registerFactory<Box<SettingThemeModel>>(() => Hive.box<SettingThemeModel>("SettingThemeModel"));
    serviceLocator.registerFactory<Box<SettingUserModel>>(() => Hive.box<SettingUserModel>("SettingUserModel"));
    serviceLocator.registerFactory<Box<SettingWalletModel>>(() => Hive.box<SettingWalletModel>("SettingWalletModel"));
    serviceLocator.registerFactory<Box<CountryInfos>>(() => Hive.box<CountryInfos>("CountryInfos"));
    serviceLocator.registerFactory<Box<FlagModel>>(() => Hive.box<FlagModel>("FlagModel"));
    serviceLocator.registerFactory<Box<CurrencyModel>>(() => Hive.box<CurrencyModel>("CurrencyModel"));
    serviceLocator.registerFactory<Box<CategoryModel>>(() => Hive.box<CategoryModel>("CategoryModel"));
    serviceLocator.registerFactory<Box<BudgetModel>>(() => Hive.box<BudgetModel>("BudgetModel"));
  }
}
