import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';

@immutable
sealed class SettingWalletEvent {
  const SettingWalletEvent();
}

class SettingFetchAllWalletsEvent extends SettingWalletEvent {
  const SettingFetchAllWalletsEvent();
}

class SettingSaveWalletEvent extends SettingWalletEvent {
  final SettingWalletEntity wallet;

  const SettingSaveWalletEvent(this.wallet);
}

class SettingSaveDefaultWalletEvent extends SettingWalletEvent {
  const SettingSaveDefaultWalletEvent();
}

class SettingDeleteWalletEvent extends SettingWalletEvent {
  final int id;

  const SettingDeleteWalletEvent(this.id);
}

class SettingChangeDefaultWalletEvent extends SettingWalletEvent {
  final int id;

  const SettingChangeDefaultWalletEvent(this.id);
}