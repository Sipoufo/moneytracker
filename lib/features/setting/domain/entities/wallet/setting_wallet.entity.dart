import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';

class SettingWalletEntity {
  int id;
  final String name;
  final CountryInfos country;
  final double amount;
  final bool isSelected;

  SettingWalletEntity({
    this.id = 0,
    required this.name,
    required this.country,
    required this.amount,
    required this.isSelected,
  });

  factory SettingWalletEntity.map(SettingWalletModel wallet) {
    return SettingWalletEntity(
      id: wallet.id,
      name: wallet.name,
      country: wallet.country,
      amount: wallet.amount,
      isSelected: wallet.isSelected,
    );
  }
}
