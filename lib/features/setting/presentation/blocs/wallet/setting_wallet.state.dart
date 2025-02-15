import 'package:flutter/material.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';

@immutable
sealed class SettingWalletState {
  const SettingWalletState();
}

final class SettingWalletInitial extends SettingWalletState {}

final class SettingWalletLoadingState extends SettingWalletState {}

final class SettingWalletSuccessFetchAllState extends SettingWalletState{
  final List<SettingWalletEntity> settingWalletsEntities;
  const SettingWalletSuccessFetchAllState(this.settingWalletsEntities);
}

final class SettingWalletSuccessSaveWalletState extends SettingWalletState{
  final SettingWalletEntity settingWalletEntity;
  const SettingWalletSuccessSaveWalletState(this.settingWalletEntity);
}

final class SettingWalletSuccessDeleteState extends SettingWalletState{
  final bool isSaved;
  const SettingWalletSuccessDeleteState(this.isSaved);
}

final class SettingWalletSuccessChangeDefaultState extends SettingWalletState{
  final bool isChange;
  const SettingWalletSuccessChangeDefaultState(this.isChange);
}

final class SettingWalletFailureState extends SettingWalletState {
  final String message;
  const SettingWalletFailureState(this.message);
}