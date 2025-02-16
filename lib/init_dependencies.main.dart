import 'package:get_it/get_it.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/hive_register.dart';
import 'package:moneytracker/injection/budget.injection.dart';
import 'package:moneytracker/injection/setting.injection.dart';
import 'package:moneytracker/injection/transaction.injection.dart';

final serviceLocator = GetIt.instance;

// Function use to centralize dependencies
void initDependencies() async {
  // Add local object to global injection
  HiveRegister.initDependencies();

  _initApplicationNavigation();
  SettingInjection.settingThemeInjection();
  SettingInjection.settingUserInjection();
  SettingInjection.settingWalletInjection();
  BudgetInjection.budgetInjection();
  TransactionInjection.transactionInjection();
}

// Function use to init onboarding dependencies
void _initApplicationNavigation() {
  serviceLocator.registerLazySingleton(
      () => ApplicationNavigationCubit(),
  );
}
