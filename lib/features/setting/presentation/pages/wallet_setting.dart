import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/setting/presentation/widgets/wallet_setting_item.widget.dart';

class WalletSetting extends StatefulWidget {
  const WalletSetting({super.key});

  @override
  State<WalletSetting> createState() => _WalletSettingState();
}

class _WalletSettingState extends State<WalletSetting> {
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
                      // Add wallet
                      Column(
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
                            onTap: () {},
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

                      // All wallets
                      Column(
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
                          const WalletSettingItemWidget(),
                        ],
                      )
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
