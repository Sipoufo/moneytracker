import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/wallet/setting_wallet.repository.dart';

class SettingSaveWalletUseCase implements UseCase<SettingWalletEntity, SettingSaveWalletParam> {
  final SettingWalletRepository settingWalletRepository;

  SettingSaveWalletUseCase(this.settingWalletRepository);

  @override
  Future<Either<Failure, SettingWalletEntity>> call(SettingSaveWalletParam params) async {
    return await settingWalletRepository.saveWallet(params.wallet);
  }
}

class SettingSaveWalletParam {
  final SettingWalletEntity wallet;

  const SettingSaveWalletParam(this.wallet);
}