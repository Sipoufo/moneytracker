import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/user/setting_fetch_current_user.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/user/setting_save_current_user.use_case.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/user/setting_user.state.dart';

class SettingUserBloc extends Bloc<SettingUserEvent, SettingUserState> {
  final SettingFetchCurrentUserUseCase _settingFetchCurrentUserUseCase;
  final SettingSaveCurrentUserUseCase _settingSaveCurrentUserUseCase;

  SettingUserBloc({
    required SettingFetchCurrentUserUseCase settingFetchCurrentUserUseCase,
    required SettingSaveCurrentUserUseCase settingSaveCurrentUserUseCase,
  })  : _settingFetchCurrentUserUseCase = settingFetchCurrentUserUseCase,
        _settingSaveCurrentUserUseCase = settingSaveCurrentUserUseCase,
        super(SettingUserInitial()) {
    on<SettingFetchCurrentUserEvent>(_onFetchCurrentUser);
    on<SettingSaveCurrentUserEvent>(_onSaveCurrentUser);
  }

  void _onFetchCurrentUser(SettingFetchCurrentUserEvent event, Emitter<SettingUserState> emit) async {
    final res = await _settingFetchCurrentUserUseCase(NoParams());
    res.fold(
      (l) => emit(SettingUserFailureState(l.message)),
      (r) => emit(SettingUserSuccessState(r)),
    );
  }

  void _onSaveCurrentUser(SettingSaveCurrentUserEvent event, Emitter<SettingUserState> emit) async {
    final res = await _settingSaveCurrentUserUseCase(SettingUpdateCurrentUserParam(event.user));
    res.fold(
          (l) => emit(SettingUserFailureState(l.message)),
          (r) => emit(SettingUserSuccessState(r)),
    );
  }
}
