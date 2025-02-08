import 'package:flutter/cupertino.dart';
import 'package:moneytracker/features/budget/presentation/pages/budget_detail.dart';
import 'package:moneytracker/features/budget/presentation/pages/new_budget_budget_name.dart';
import 'package:moneytracker/features/navigation/page/navigation.dart';
import 'package:moneytracker/features/onboarding/page/onboarding.dart';
import 'package:moneytracker/features/setting/presentation/pages/account_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/current_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/wallet_setting.dart';
import 'package:moneytracker/features/splash/splash.dart';
import 'package:moneytracker/features/transaction/presentation/pages/new_transaction.dart';
import 'package:moneytracker/features/transaction/presentation/pages/transaction_detail.dart';

Map<String, WidgetBuilder> get generalRoutes => <String, WidgetBuilder> {
  "/": (context) => const Splash(),
  "/onboarding": (context) => const Onboarding(),
  "/navigation": (context) => const Navigation(),

  // Transaction part
  "/transaction/transaction-detail": (context) => const TransactionDetail(),
  "/transaction/new-transaction": (context) => const NewTransactionWidget(),

  // Budget part
  "/budget/budget-detail": (context) => const BudgetDetail(),
  "/budget/new-budget": (context) => const NewBudget(),

  // Setting part
  "/setting/account": (context) => const AccountSetting(),
  "/setting/wallet": (context) => const WalletSetting(),
  "/setting/currency": (context) => const CurrentSetting(),
};
