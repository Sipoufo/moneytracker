import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/wallet/setting_delete_one_wallet.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/wallet/setting_fetch_all_wallets.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/wallet/setting_save_default_wallet.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/wallet/setting_save_wallet.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/wallet/setting_change_default_wallet.use_case.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.state.dart';

class SettingWalletBloc extends Bloc<SettingWalletEvent, SettingWalletState> {
  final SettingFetchAllWalletUseCase _settingFetchAllWalletUseCase;
  final SettingSaveWalletUseCase _settingSaveWalletUseCase;
  final SettingSaveDefaultWalletUseCase _settingSaveDefaultWalletUseCase;
  final SettingDeleteOneCurrentWalletUseCase _settingDeleteOneCurrentWalletUseCase;
  final SettingChangeDefaultWalletUseCase _settingChangeDefaultWalletUseCase;

  SettingWalletBloc({
    required SettingFetchAllWalletUseCase settingFetchAllWalletUseCase,
    required SettingSaveWalletUseCase settingSaveWalletUseCase,
    required SettingSaveDefaultWalletUseCase settingSaveDefaultWalletUseCase,
    required SettingDeleteOneCurrentWalletUseCase settingDeleteOneCurrentWalletUseCase,
    required SettingChangeDefaultWalletUseCase settingChangeDefaultWalletUseCase,
  })  : _settingFetchAllWalletUseCase = settingFetchAllWalletUseCase,
        _settingSaveWalletUseCase = settingSaveWalletUseCase,
        _settingSaveDefaultWalletUseCase = settingSaveDefaultWalletUseCase,
        _settingDeleteOneCurrentWalletUseCase = settingDeleteOneCurrentWalletUseCase,
        _settingChangeDefaultWalletUseCase = settingChangeDefaultWalletUseCase,
        super(SettingWalletInitial()) {
    on<SettingFetchAllWalletsEvent>(_onFetchAllWallets);
    on<SettingSaveWalletEvent>(_onSaveWallet);
    on<SettingSaveDefaultWalletEvent>(_onSaveDefaultWallet);
    on<SettingDeleteWalletEvent>(_onDeleteWallet);
    on<SettingChangeDefaultWalletEvent>(_onChangeDefaultWallet);
    on<SettingWalletEvent>((_, emit) {
      emit(SettingWalletLoadingState());
    });
  }

  void _onFetchAllWallets(SettingFetchAllWalletsEvent event, Emitter<SettingWalletState> emit) async {
    final res = await _settingFetchAllWalletUseCase(NoParams());
    res.fold(
      (l) => emit(SettingWalletFailureState(l.message)),
      (r) => emit(SettingWalletSuccessFetchAllState(r)),
    );
  }

  void _onSaveWallet(SettingSaveWalletEvent event, Emitter<SettingWalletState> emit) async {
    final res = await _settingSaveWalletUseCase(SettingSaveWalletParam(event.wallet));
    res.fold(
          (l) => emit(SettingWalletFailureState(l.message)),
          (r) => emit(SettingWalletSuccessSaveWalletState(r)),
    );
  }

  void _onSaveDefaultWallet(SettingSaveDefaultWalletEvent event, Emitter<SettingWalletState> emit) async {
    final res = await _settingSaveDefaultWalletUseCase(NoParams());
    res.fold(
          (l) => emit(SettingWalletFailureState(l.message)),
          (r) => emit(SettingWalletSuccessFetchAllState(r)),
    );
  }

  void _onDeleteWallet(SettingDeleteWalletEvent event, Emitter<SettingWalletState> emit) async {
    final res = await _settingDeleteOneCurrentWalletUseCase(SettingDeleteOneWalletParam(event.id));
    res.fold(
          (l) => emit(SettingWalletFailureState(l.message)),
          (r) => emit(SettingWalletSuccessDeleteState(r)),
    );
  }

  void _onChangeDefaultWallet(SettingChangeDefaultWalletEvent event, Emitter<SettingWalletState> emit) async {
    final res = await _settingChangeDefaultWalletUseCase(SettingChangeDefaultWalletParam(event.id));
    res.fold(
          (l) => emit(SettingWalletFailureState(l.message)),
          (r) => emit(SettingWalletSuccessChangeDefaultState(r)),
    );
  }
}
