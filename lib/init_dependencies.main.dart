import 'package:get_it/get_it.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';

final serviceLocator = GetIt.instance;

// Function use to centralize dependencies
Future<void> initDependencies() async {
  _initApplicationNavigation();
}

// Function use to init onboarding dependencies
void _initApplicationNavigation() {
  serviceLocator.registerLazySingleton(
      () => ApplicationNavigationCubit(),
  );
}
