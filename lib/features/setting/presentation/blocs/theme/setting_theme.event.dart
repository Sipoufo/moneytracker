import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/setting_theme_mode.entity.dart';

@immutable
sealed class SettingThemeEvent {
  const SettingThemeEvent();
}

class SettingFetchCurrentThemeEvent extends SettingThemeEvent {
  const SettingFetchCurrentThemeEvent();
}

class SettingUpdateCurrentThemeEvent extends SettingThemeEvent {
  final SettingThemeEntity settingThemeEntity;

  const SettingUpdateCurrentThemeEvent(this.settingThemeEntity);
}