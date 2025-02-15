import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/features/setting/data/models/currency/setting_currency.model.dart';

class SettingCurrencyEntity {
  final CountryInfos country;

  const SettingCurrencyEntity({
    required this.country,
  });

  factory SettingCurrencyEntity.map(SettingCurrencyModel currency) {
    return SettingCurrencyEntity(
        country: currency.country,
    );
  }
}