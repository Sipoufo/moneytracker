import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/wallet/setting_wallet.repository.dart';

class SettingDeleteOneCurrentWalletUseCase implements UseCase<bool, SettingDeleteOneWalletParam> {
  final SettingWalletRepository settingWalletRepository;

  SettingDeleteOneCurrentWalletUseCase(this.settingWalletRepository);

  @override
  Future<Either<Failure, bool>> call(SettingDeleteOneWalletParam params) async {
    return await settingWalletRepository.deleteOneWallet(params.id);
  }
}

class SettingDeleteOneWalletParam {
  final int id;

  const SettingDeleteOneWalletParam(this.id);
}