import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

part 'setting_wallet.model.g.dart';

/// Use to manage the state across the app
/// [name] represent the name of wallet
/// [country] represent the country information
/// [amount] represent the current amount
@HiveType(typeId: 03)
class SettingWalletModel {
  @HiveField(00)
  int id;

  @HiveField(01)
  final String name;

  @HiveField(02)
  final CountryInfos country;

  @HiveField(03)
  final double amount;

  @HiveField(04)
  bool isSelected;

  SettingWalletModel({
    this.id = 14,
    required this.name,
    required this.country,
    required this.amount,
    this.isSelected = false,
  });

  factory SettingWalletModel.map(SettingWalletEntity wallet) {
    return SettingWalletModel(
      id: wallet.id,
      name: wallet.name,
      country: wallet.country,
      amount: wallet.amount,
      isSelected: wallet.isSelected,
    );
  }
}
