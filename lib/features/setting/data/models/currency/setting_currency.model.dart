import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/features/setting/domain/entities/currency/setting_currency.entity.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

part 'setting_currency.model.g.dart';

/// Use to manage the state across the app
@HiveType(typeId: 04)
class SettingCurrencyModel {
  @HiveField(00)
  final CountryInfos country;

  const SettingCurrencyModel({
    required this.country,
  });

  factory SettingCurrencyModel.map(SettingCurrencyEntity currency) {
    return SettingCurrencyModel(
      country: currency.country,
    );
  }
}
