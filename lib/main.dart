import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/bloc_providers.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/theme/theme.util.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.state.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.state.dart';
import 'package:moneytracker/hive_register.dart';
import 'package:moneytracker/init_dependencies.main.dart';
import 'package:moneytracker/routes/general_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/routes/param_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive initialization
  await Hive.initFlutter();

  // Hives objects registrations
  HiveRegister.allHivesObjectsRegister();

  // Open all hives boxes
  await HiveRegister.openAllBoxes();

  // Dependencies initializations
  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: AppBlocProvider.allBlocProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    // Get current theme
    context.read<SettingThemeBloc>().add(const SettingFetchCurrentThemeEvent());
    // Save default wallet
    context.read<SettingWalletBloc>().add(const SettingSaveDefaultWalletEvent());
    // Init default wallet
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingThemeBloc, SettingThemeState>(
      listener: (context, state) {
        if (state is SettingThemeSuccessState) {
          setState(() {
            themeMode = state.settingThemeEntity.themeMode;
          });
        }
      },
      builder: (context, state) {
        ThemeMode themeMode = state is SettingThemeSuccessState ? state.settingThemeEntity.themeMode : ThemeMode.system;
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
          themeMode: themeMode,
          theme: ThemeUtil.light,
          darkTheme: ThemeUtil.dark,
          debugShowCheckedModeBanner: false,
          routes: generalRoutes,
          onGenerateRoute: (setting) => paramRoutes(setting),
        );
      },
    );
  }
}
