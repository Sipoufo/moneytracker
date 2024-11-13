import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/theme.util.dart';
import 'package:moneytracker/routes/general_routes.dart';
import 'package:moneytracker/features/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin Sensei',
      theme: ThemeUtil.light,
      darkTheme: ThemeUtil.dark,
      debugShowCheckedModeBanner: false,
      routes: generalRoutes,
    );
  }
}
