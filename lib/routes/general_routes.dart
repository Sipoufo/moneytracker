import 'package:flutter/cupertino.dart';
import 'package:moneytracker/features/navigation/page/navigation.dart';
import 'package:moneytracker/features/onboarding/page/onboarding.dart';
import 'package:moneytracker/features/setting/presentation/pages/account_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/add_wallet_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/category_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/currency_setting.dart';
import 'package:moneytracker/features/setting/presentation/pages/wallet_setting.dart';
import 'package:moneytracker/features/splash/splash.dart';
import 'package:moneytracker/features/transaction/presentation/pages/new_transaction.dart';
import 'package:moneytracker/features/transaction/presentation/pages/transaction_detail.dart';

Map<String, WidgetBuilder> get generalRoutes => <String, WidgetBuilder> {
  "/": (context) => const Splash(),
  "/onboarding": (context) => const Onboarding(),
  "/navigation": (context) => const Navigation(),

  // Transaction part
  "/transaction/new-transaction": (context) => const NewTransactionWidget(),

  // Setting part
  "/setting/account": (context) => const AccountSetting(),
  "/setting/wallet": (context) => const WalletSetting(),
  "/setting/new_wallet": (context) => const AddWalletSetting(),
  "/setting/currency": (context) => const CurrentSetting(),
  "/setting/category": (context) => const CategorySetting(),
};
