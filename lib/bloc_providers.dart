import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.bloc.dart';
import 'package:moneytracker/init_dependencies.main.dart';

class AppBlocProvider {
  static get allBlocProviders => [
        BlocProvider(create: (_) => serviceLocator<ApplicationNavigationCubit>()),
        BlocProvider(create: (_) => serviceLocator<SettingThemeBloc>()),
      ];
}
