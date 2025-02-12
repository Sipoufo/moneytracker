import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/theme/setting_theme.entity.dart';

@immutable
sealed class SettingThemeState {
  const SettingThemeState();
}

final class SettingThemeInitial extends SettingThemeState {}

final class SettingThemeLoadingState extends SettingThemeState {}

final class SettingThemeSuccessState extends SettingThemeState{
  final SettingThemeEntity settingThemeEntity;
  const SettingThemeSuccessState(this.settingThemeEntity);
}

final class SettingThemeFailureState extends SettingThemeState {
  final String message;
  const SettingThemeFailureState(this.message);
}