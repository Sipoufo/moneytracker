import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_fetch_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/domain/uses_cases/theme/setting_update_current_theme.use_case.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/theme/setting_theme.state.dart';

class SettingThemeBloc extends Bloc<SettingThemeEvent, SettingThemeState> {
  final SettingFetchCurrentThemeUseCase _settingFetchCurrentThemeUseCase;
  final SettingUpdateCurrentThemeUseCase _settingUpdateCurrentThemeUseCase;

  SettingThemeBloc({
    required SettingFetchCurrentThemeUseCase settingFetchCurrentThemeUseCase,
    required SettingUpdateCurrentThemeUseCase settingUpdateCurrentThemeUseCase,
  })  : _settingFetchCurrentThemeUseCase = settingFetchCurrentThemeUseCase,
        _settingUpdateCurrentThemeUseCase = settingUpdateCurrentThemeUseCase,
        super(SettingThemeInitial()) {
    on<SettingFetchCurrentThemeEvent>(_onFetchCurrentTheme);
    on<SettingUpdateCurrentThemeEvent>(_onUpdateCurrentTheme);
  }

  void _onFetchCurrentTheme(SettingFetchCurrentThemeEvent event, Emitter<SettingThemeState> emit) async {
    final res = await _settingFetchCurrentThemeUseCase(NoParams());
    res.fold(
      (l) => emit(SettingThemeFailureState(l.message)),
      (r) => emit(SettingThemeSuccessState(r)),
    );
  }

  void _onUpdateCurrentTheme(SettingUpdateCurrentThemeEvent event, Emitter<SettingThemeState> emit) async {
    final res = await _settingUpdateCurrentThemeUseCase(SettingUpdateCurrentThemeParam(event.settingThemeEntity));
    res.fold(
          (l) => emit(SettingThemeFailureState(l.message)),
          (r) => emit(SettingThemeSuccessState(r)),
    );
  }
}
