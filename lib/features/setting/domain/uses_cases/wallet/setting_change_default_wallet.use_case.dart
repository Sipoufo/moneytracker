import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/wallet/setting_wallet.repository.dart';

class SettingChangeDefaultWalletUseCase implements UseCase<bool, SettingChangeDefaultWalletParam> {
  final SettingWalletRepository settingWalletRepository;

  SettingChangeDefaultWalletUseCase(this.settingWalletRepository);

  @override
  Future<Either<Failure, bool>> call(SettingChangeDefaultWalletParam params) async {
    return await settingWalletRepository.setAsDefault(params.id);
  }
}

class SettingChangeDefaultWalletParam {
  final int id;

  const SettingChangeDefaultWalletParam(this.id);
}