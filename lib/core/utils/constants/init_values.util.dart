import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Class use for general init values
class InitValuesUtil {
  // ---------- Dates ----------
  static int startDate = 1900;
  static int endDate = 2100;

  // ---------- Transactions steps ----------
  static List<String> transactionsSteps(BuildContext context) {
    return [
      "1. ${AppLocalizations.of(context).walletCategories}",
      "2. ${AppLocalizations.of(context).amount}",
      "3. ${AppLocalizations.of(context).dateTime}",
      "4. ${AppLocalizations.of(context).nameNote}",
      "5. ${AppLocalizations.of(context).review}",
    ];
  }

  // ---------- Init shared preferences ----------
  static final Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
}
