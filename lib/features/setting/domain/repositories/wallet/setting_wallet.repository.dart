import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';

// Abstract class use to manage theme
abstract interface class SettingWalletRepository {
  /// Use to fetch all wallet
  Future<Either<Failure, List<SettingWalletEntity>>> fetchCurrentWallet();

  /// Use to save one wallet
  Future<Either<Failure, SettingWalletEntity>> saveWallet(SettingWalletEntity wallet);

  /// Use to save one wallet
  Future<Either<Failure, List<SettingWalletEntity>>> saveDefaultWallet();

  /// Use to save one wallet
  Future<Either<Failure, bool>> deleteOneWallet(int id);

  /// Use to change default wallet
  Future<Either<Failure, bool>> setAsDefault(int id);
}