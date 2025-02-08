import 'package:moneytracker/core/utils/models/currency.model.dart';
import 'package:moneytracker/core/utils/models/flag.model.dart';

/// This class is use to mange flag of country
/// [name] represent the name of country
/// [isoCode] represent the iso abbreviation of country
/// [phoneCode] represent the phone code of country
/// [flag] represent the object that contain of information about flag
/// [currency] represent the object that contain of information about currency
class CountryInfos {
  final String name;
  final String isoCode;
  final String phoneCode;
  final FlagModel flag;
  final CurrencyModel currency;

  CountryInfos({
    required this.name,
    required this.isoCode,
    required this.phoneCode,
    required this.flag,
    required this.currency,
  });

  /// Use to convert json data to object
  factory CountryInfos.fromJson(dynamic item) {
    return CountryInfos(
      name: item["name"],
      isoCode: item["isoCode"],
      phoneCode: item["phoneCode"],
      flag: FlagModel.fromJson(item["flag"]),
      currency: CurrencyModel.fromJson(item["currency"]),
    );
  }
}
