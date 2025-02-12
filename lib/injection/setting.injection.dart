import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.impl.dart';
import 'package:moneytracker/features/setting/data/models/setting_theme.model.dart';
import 'package:moneytracker/features/setting/data/repositories/setting_theme.repository_impl.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service.dart';
import 'package:moneytracker/features/setting/data/services/theme/setting_theme.service_impl.dart';
import 'package:moneytracker/features/setting/domain/repositories/theme/setting_theme.repository.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_fetch_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_update_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.bloc.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class SettingInjection {
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
}
