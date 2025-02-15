import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.state.dart';
import 'package:moneytracker/features/setting/presentation/widgets/wallet_setting_item.widget.dart';

class WalletSetting extends StatefulWidget {
  const WalletSetting({super.key});

  @override
  State<WalletSetting> createState() => _WalletSettingState();
}

class _WalletSettingState extends State<WalletSetting> {
  @override
  void initState() {
    context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of account setting page
            HeaderWidget(
              title: AppLocalizations.of(context).wallet,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),
            // Add wallet
            Padding(
              padding: const EdgeInsets.all(SizeUtil.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SizeUtil.spaceBtwItems_12,
                children: [
                  // Title
                  Text(
                    AppLocalizations.of(context).other,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                  ),

                  // Button add new wallet
                  ButtonWidget(
                    title: AppLocalizations.of(context).addNewWallet,
                    textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: ColorsUtils.primary_4,
                    ),
                    onTap: () => Navigator.pushNamed(context, "/setting/new_wallet"),
                    padding: const EdgeInsets.all(SizeUtil.md_18),
                    color: Theme.of(context).colorScheme.primaryContainer,
                    icon: const Icon(
                      Icons.add,
                      color: ColorsUtils.primary_4,
                      size: SizeUtil.iconMd,
                    ),
                    border: const BorderSide(color: ColorsUtils.primary_4, style: BorderStyle.solid),
                  ),
                ],
              ),
            ),

            // Contain
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(SizeUtil.md),
                  child: Column(
                    spacing: SizeUtil.defaultSpace,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocConsumer<SettingWalletBloc, SettingWalletState>(
                        listener: (context, state) {
                          if (state is SettingWalletSuccessDeleteState) {
                            context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
                          }
                          if (state is SettingWalletSuccessChangeDefaultState) {
                            context.read<SettingWalletBloc>().add(const SettingFetchAllWalletsEvent());
                          }
                        },
                        builder: (context, state) {
                          if (state is SettingWalletLoadingState) {
                            return const Expanded(child: LoadingWidget());
                          }

                          // All wallets
                          if (state is SettingWalletSuccessFetchAllState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: SizeUtil.spaceBtwItems_12,
                              children: [
                                // Title
                                Text(
                                  AppLocalizations.of(context).yoursWallets,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                                ),

                                Column(
                                  spacing: SizeUtil.spaceBtwItems_8,
                                  children: state.settingWalletsEntities.map((wallet) {
                                    return WalletSettingItemWidget(settingWalletEntity: wallet,);
                                  }).toList(),
                                ),
                              ],
                            );
                          }

                          // Any else
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
