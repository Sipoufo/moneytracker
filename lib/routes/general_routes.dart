import 'package:flutter/cupertino.dart';
import 'package:moneytracker/features/onboarding/onboarding.dart';
import 'package:moneytracker/features/splash/splash.dart';

Map<String, WidgetBuilder> get generalRoutes => <String, WidgetBuilder> {
  "/": (context) => const Splash(),
  "/onboarding": (context) => const Onboarding(),
};
