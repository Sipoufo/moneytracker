import 'package:collection/collection.dart';
import 'package:moneytracker/core/error/exception.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/models/country_infos.model.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';
import 'package:moneytracker/features/setting/data/services/wallet/setting_wallet.service.dart';

// Class use to manage wallet
class SettingWalletServiceImpl implements SettingWalletService {
  final LocalDataService<SettingWalletModel> localDataService;

  SettingWalletServiceImpl(this.localDataService);

  /// Return all wallets
  @override
  List<SettingWalletModel> fetchAllWallets() {
    return localDataService.loadData();
  }

  /// [wallet] represent the wallet that we want to save
  /// Return the wallet saved
  @override
  Future<SettingWalletModel> saveWallet(SettingWalletModel wallet) async {
    List<SettingWalletModel> wallets = localDataService.loadData();
    List<SettingWalletModel> walletExisted = wallets.where((existedWallet) => existedWallet.name.toLowerCase() == wallet.name.toLowerCase()).toList();

    if (walletExisted.isNotEmpty) {
      throw "This wallet name exist";
    }

    wallet.id = wallets.length;
    int walletSavedId = await localDataService.addLocalData(data: wallet);
    wallet.id = walletSavedId;
    await localDataService.updateLocalData(id: wallet.id, data: wallet);
    return wallet;
  }

  /// Return the wallet saved
  @override
  Future<List<SettingWalletModel>> saveDefaultWallet() async {
    List<CountryInfos> countries = await InformationUtil.countries();
    List<SettingWalletModel> wallets = fetchAllWallets();
    final prefs = await InitValuesUtil.sharedPreferences;

    if (wallets.isNotEmpty) {
      for (SettingWalletModel wallet in wallets) {
        if (wallet.isSelected == true) {
          await prefs.setString("currency", wallet.country.currency.symbol);
        }
      }
      return wallets;
    }

    SettingWalletModel wallet = SettingWalletModel(
      id: 0,
      name: "Default wallet",
      country: countries[149],
      amount: 0,
      isSelected: true,
    );
    await prefs.setString("currency", countries[149].currency.symbol);
    await prefs.setString("countryName", countries[149].name);
    await localDataService.updateLocalData(id: wallet.id ?? 0, data: wallet);
    return [wallet];
  }

  /// [id] represent the id that we want to fetch
  /// Return one wallet
  @override
  SettingWalletModel? fetchOneWallet(int id) {
    return localDataService.loadOneData(id: id);
  }

  /// Return boolean indicate if the specific wallet (represent by id) is deleted
  @override
  Future<bool> deleteOneWallet(int id) async {
    await localDataService.deleteOneLocalData(id: id);
    List<SettingWalletModel> wallets = fetchAllWallets();

    if (wallets.where((wallet) => wallet.isSelected == true).isEmpty) {
      wallets[0].isSelected = true;
      await localDataService.updateLocalData(id: wallets[0].id, data: wallets[0]);
    }
    return true;
  }

  /// [id] represent the id that we want to fetch
  /// Return boolean
  @override
  Future<bool> setAsDefault(int id) async {
    List<SettingWalletModel> wallets = fetchAllWallets();
    SettingWalletModel? wallet = wallets.firstWhereOrNull((item) => item.id == id);

    // Check if wallet that we want to find exit
    if (wallet == null) {
      throw "This wallet don't exist";
    }

    // Put last select wallet not select
    for (SettingWalletModel item in wallets) {
      if (item.isSelected == true) {
        item.isSelected = false;
        await localDataService.updateLocalData(id: item.id, data: item);
      }
    }

    // Put find wallet to select
    wallet.isSelected = true;
    await localDataService.updateLocalData(id: wallet.id, data: wallet);
    return true;
  }
}
