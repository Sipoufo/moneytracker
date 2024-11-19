import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/bloc_providers.dart';
import 'package:moneytracker/core/utils/theme/theme.util.dart';
import 'package:moneytracker/init_dependencies.main.dart';
import 'package:moneytracker/routes/general_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive initialization
  await Hive.initFlutter();

  // Dependencies initializations
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Sensei',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('fr'), // French
      ],
      themeMode: ThemeMode.system,
      theme: ThemeUtil.light,
      darkTheme: ThemeUtil.dark,
      debugShowCheckedModeBanner: false,
      routes: generalRoutes,
    );
  }
}
