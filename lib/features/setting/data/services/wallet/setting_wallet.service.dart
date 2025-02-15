import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';

// Abstract class use to manage wallet
abstract  interface class SettingWalletService {
  /// Use to fetch all wallets
  List<SettingWalletModel> fetchAllWallets();

  /// Use to save one wallet
  Future<SettingWalletModel> saveWallet(SettingWalletModel wallet);

  /// Use to save default wallet
  Future<List<SettingWalletModel>> saveDefaultWallet();

  /// Use to find one wallet
  SettingWalletModel? fetchOneWallet(int id);

  /// Use to delete one wallet
  Future<bool> deleteOneWallet(int id);

  /// Use to change default wallet
  Future<bool> setAsDefault(int id);
}