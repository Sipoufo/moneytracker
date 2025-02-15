import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/domain/repositories/wallet/setting_wallet.repository.dart';

class SettingFetchAllWalletUseCase implements UseCase<List<SettingWalletEntity>, NoParams> {
  final SettingWalletRepository settingWalletRepository;

  SettingFetchAllWalletUseCase(this.settingWalletRepository);

  @override
  Future<Either<Failure, List<SettingWalletEntity>>> call(NoParams params) async {
    return await settingWalletRepository.fetchCurrentWallet();
  }
}