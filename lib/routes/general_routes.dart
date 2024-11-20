import 'package:flutter/cupertino.dart';
import 'package:moneytracker/features/navigation/page/navigation.dart';
import 'package:moneytracker/features/onboarding/page/onboarding.dart';
import 'package:moneytracker/features/splash/splash.dart';
import 'package:moneytracker/features/transaction/presentation/pages/transaction_detail.dart';

Map<String, WidgetBuilder> get generalRoutes => <String, WidgetBuilder> {
  "/": (context) => const Splash(),
  "/onboarding": (context) => const Onboarding(),
  "/navigation": (context) => const Navigation(),

  // Transaction part
  "/transaction/transaction-detail": (context) => const TransactionDetail(),
};
