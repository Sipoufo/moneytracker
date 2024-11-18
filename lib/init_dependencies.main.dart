import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

// Function use to centralize dependencies
Future<void> initDependencies() async {
  _initOnboarding();
}

// Function use to init onboarding dependencies
void _initOnboarding() {
}
