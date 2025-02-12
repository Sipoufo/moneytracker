import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/user/setting_user.entity.dart';

@immutable
sealed class SettingUserEvent {
  const SettingUserEvent();
}

class SettingFetchCurrentUserEvent extends SettingUserEvent {
  const SettingFetchCurrentUserEvent();
}

class SettingSaveCurrentUserEvent extends SettingUserEvent {
  final SettingUserEntity user;

  const SettingSaveCurrentUserEvent(this.user);
}