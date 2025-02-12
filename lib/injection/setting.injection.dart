import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.impl.dart';
import 'package:moneytracker/features/setting/data/models/theme/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/models/user/setting_user.model.dart';
import 'package:moneytracker/features/setting/data/repositories/theme/setting_theme.repository_impl.dart';
import 'package:moneytracker/features/setting/data/repositories/user/setting_user.repository_impl.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service_impl.dart';
import 'package:moneytracker/features/setting/data/services/user/setting_user.service.dart';
import 'package:moneytracker/features/setting/data/services/user/setting_user.service_impl.dart';
import 'package:moneytracker/features/setting/domain/repositories/theme/setting_theme.repository.dart';
import 'package:moneytracker/features/setting/domain/repositories/user/setting_user.repository.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_fetch_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_update_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/user/setting_fetch_current_user.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/user/setting_save_current_user.use_case.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.bloc.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class SettingInjection {
  // Injection for theme part
  static void settingThemeInjection() {
    serviceLocator
      ..registerFactory<LocalDataService<SettingThemeModel>>(
        () => LocalDataServiceImpl<SettingThemeModel>(
          serviceLocator<Box<SettingThemeModel>>(),
        ),
      )
      ..registerFactory<SettingThemeService>(
        () => SettingThemeServiceImpl(serviceLocator<LocalDataService<SettingThemeModel>>()),
      )
      ..registerFactory<SettingThemeRepository>(
        () => SettingThemeRepositoryImpl(serviceLocator<SettingThemeService>()),
      )
      ..registerFactory<SettingFetchCurrentThemeUseCase>(
        () => SettingFetchCurrentThemeUseCase(serviceLocator<SettingThemeRepository>()),
      )
      ..registerFactory<SettingUpdateCurrentThemeUseCase>(
        () => SettingUpdateCurrentThemeUseCase(serviceLocator<SettingThemeRepository>()),
      )
      ..registerFactory<SettingThemeBloc>(
        () => SettingThemeBloc(
          settingFetchCurrentThemeUseCase: serviceLocator<SettingFetchCurrentThemeUseCase>(),
          settingUpdateCurrentThemeUseCase: serviceLocator<SettingUpdateCurrentThemeUseCase>(),
        ),
      );
  }

  // Injection for user part
  static void settingUserInjection() {
    serviceLocator
      ..registerFactory<LocalDataService<SettingUserModel>>(
            () => LocalDataServiceImpl<SettingUserModel>(
          serviceLocator<Box<SettingUserModel>>(),
        ),
      )
      ..registerFactory<SettingUserService>(
            () => SettingUserServiceImpl(serviceLocator<LocalDataService<SettingUserModel>>()),
      )
      ..registerFactory<SettingUserRepository>(
            () => SettingUserRepositoryImpl(serviceLocator<SettingUserService>()),
      )
      ..registerFactory<SettingFetchCurrentUserUseCase>(
            () => SettingFetchCurrentUserUseCase(serviceLocator<SettingUserRepository>()),
      )
      ..registerFactory<SettingSaveCurrentUserUseCase>(
            () => SettingSaveCurrentUserUseCase(serviceLocator<SettingUserRepository>()),
      )
      ..registerFactory<SettingUserBloc>(
            () => SettingUserBloc(
          settingFetchCurrentUserUseCase: serviceLocator<SettingFetchCurrentUserUseCase>(),
          settingSaveCurrentUserUseCase: serviceLocator<SettingSaveCurrentUserUseCase>(),
        ),
      );
  }
}
