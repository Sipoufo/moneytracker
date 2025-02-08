import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';

/// Use to get different information with translation effect
class InformationUtil {
  // List of values of all days with translation effect
  static List<String> dayValues(BuildContext context) {
    return [
      AppLocalizations.of(context).monday,
      AppLocalizations.of(context).thursday,
      AppLocalizations.of(context).wednesday,
      AppLocalizations.of(context).tuesday,
      AppLocalizations.of(context).friday,
      AppLocalizations.of(context).saturday,
      AppLocalizations.of(context).sunday,
    ];
  }

  // List of values of all months with translation effect
  static List<String> monthValues(BuildContext context) {
    return [
      AppLocalizations.of(context).january,
      AppLocalizations.of(context).february,
      AppLocalizations.of(context).march,
      AppLocalizations.of(context).april,
      AppLocalizations.of(context).may,
      AppLocalizations.of(context).june,
      AppLocalizations.of(context).july,
      AppLocalizations.of(context).august,
      AppLocalizations.of(context).september,
      AppLocalizations.of(context).october,
      AppLocalizations.of(context).november,
      AppLocalizations.of(context).december,
    ];
  }

  // List of values of all periodic with translation effect
  static List<String> periodicValues(BuildContext context) {

    return [
      AppLocalizations.of(context).daily,
      AppLocalizations.of(context).monthly,
      AppLocalizations.of(context).annually,
    ];
  }

  // List of values of all periodic with translation effect
  static List<Map<String, dynamic>> periodicValuesAndCorrespondent(BuildContext context) {
    DateTime now = DateTime(DateTime.now().year, DateTime.now().month);
    DateTime nextDate = DateTime(DateTime.now().year, DateTime.now().month + 1);

    return [
      {
        "period": AppLocalizations.of(context).daily,
        "values": InformationUtil.dayValues(context),
      },
      {
        "period": AppLocalizations.of(context).monthly,
        "values": List<int>.generate(
          nextDate.difference(now).inDays,
          (day) => day + 1,
        ),
      },
      {
        "period": AppLocalizations.of(context).annually,
        "values": InformationUtil.monthValues(context),
      },
    ];
  }

  // List of values of categories types
  static List<Map<String, dynamic>> categoriesTypes(BuildContext context) {
    return [
      {
        "type": AppLocalizations.of(context).earnedIncome,
        "values": <String>[
          AppLocalizations.of(context).salariesAndWages,
          AppLocalizations.of(context).overtimePay,
          AppLocalizations.of(context).bonusesAndCommissions,
          AppLocalizations.of(context).tipsAndGratuities,
        ]
      },
      {
        "type": AppLocalizations.of(context).selfEmployment,
        "values": <String>[
          AppLocalizations.of(context).soleProprietorship,
          AppLocalizations.of(context).partnerships,
        ]
      },
      {
        "type": AppLocalizations.of(context).investment,
        "values": [
          AppLocalizations.of(context).capitalGains,
          AppLocalizations.of(context).interest,
          AppLocalizations.of(context).dividend,
        ]
      },
      {
        "type": AppLocalizations.of(context).rental,
        "values": [
          AppLocalizations.of(context).property,
          AppLocalizations.of(context).vehicle,
          AppLocalizations.of(context).commercial,
        ]
      },
    ];
  }

  // List of hours
  static List<String> hours = List.generate(12, (index) {
    return index < 9 ? "0${index + 1}" : "${index + 1}";
  });

  // List of hours
  static List<String> minutes = List.generate(60, (index) {
    return index < 9 ? "0$index" : "$index";
  });

  // List of dailies segments
  static List<String> dailiesSegments = [
    "AM",
    "PM",
  ];

  // Country information
  static Future<List<CountryInfos>> countries() async {
    List<CountryInfos> result = [];
    dynamic countriesJson = await HelperFunctions.readJson("assets/json/country_currency_flag_phone_code.json");

    for(dynamic country in countriesJson) {
      result.add(CountryInfos.fromJson(country));
    }

    return result;
  }
}
