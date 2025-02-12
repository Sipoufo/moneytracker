import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

@immutable
sealed class SettingUserState {
  const SettingUserState();
}

final class SettingUserInitial extends SettingUserState {}

final class SettingUserLoadingState extends SettingUserState {}

final class SettingUserSuccessState extends SettingUserState{
  final SettingUserEntity? settingUserEntity;
  const SettingUserSuccessState(this.settingUserEntity);
}

final class SettingUserFailureState extends SettingUserState {
  final String message;
  const SettingUserFailureState(this.message);
}