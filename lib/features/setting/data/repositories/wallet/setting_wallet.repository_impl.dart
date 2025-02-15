import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';
import 'package:moneytracker/features/setting/data/services/wallet/setting_wallet.service.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/wallet/setting_wallet.repository.dart';

class SettingWalletRepositoryImpl implements SettingWalletRepository {
  final SettingWalletService settingWalletService;

  SettingWalletRepositoryImpl(this.settingWalletService);

  @override
  Future<Either<Failure, List<SettingWalletEntity>>> fetchCurrentWallet() async {
    try {
      return Right(settingWalletService.fetchAllWallets().map((wallet) => SettingWalletEntity.map(wallet)).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingWalletEntity>> saveWallet(SettingWalletEntity wallet) async {
    try {
      return right(SettingWalletEntity.map(await settingWalletService.saveWallet(SettingWalletModel.map(wallet))));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SettingWalletEntity>>> saveDefaultWallet() async {
    try {
      List<SettingWalletModel> wallets = await settingWalletService.saveDefaultWallet();
      return Right(wallets.map((wallet) => SettingWalletEntity.map(wallet)).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOneWallet(int id) async {
    try {
      return right(await settingWalletService.deleteOneWallet(id));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setAsDefault(int id) async {
    try {
      return right(await settingWalletService.setAsDefault(id));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}