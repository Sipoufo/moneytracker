import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/models/category.model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Class use for general init values
class InitValuesUtil {
  // ---------- Categories ----------
  static List<CategoryModel> categories(BuildContext context) {
    return [
      CategoryModel(
          name: AppLocalizations.of(context).education,
          picture: "assets/pictures/categories/education.png",
          backgroundColor: ColorsUtils.malibu),
      CategoryModel(
          name: AppLocalizations.of(context).food,
          picture: "assets/pictures/categories/food.png",
          backgroundColor: ColorsUtils.broom),
      CategoryModel(
          name: AppLocalizations.of(context).gift,
          picture: "assets/pictures/categories/gift.png",
          backgroundColor: ColorsUtils.broom),
      CategoryModel(
          name: AppLocalizations.of(context).investment,
          picture: "assets/pictures/categories/investment.png",
          backgroundColor: ColorsUtils.primary_2),
      CategoryModel(
          name: AppLocalizations.of(context).vehicle,
          picture: "assets/pictures/categories/vehicle.png",
          backgroundColor: ColorsUtils.malibu),
    ];
  }

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
}
