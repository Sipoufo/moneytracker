import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/setting/presentation/widgets/setting_item.widget.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // Switch button value
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            HeaderWidget(
              title: AppLocalizations.of(context).transactionDetail,
              secondIcon: Container(
                padding: const EdgeInsets.all(SizeUtil.md),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsUtils.primary_5,
                ),
                child: Text(
                  "S",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),

            // Contain
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: SizeUtil.sm_12,
                    horizontal: SizeUtil.md,
                  ),
                  child: Column(
                    children: [
                      // Account
                      SettingItemWidget(
                        title: AppLocalizations.of(context).account,
                        label: AppLocalizations.of(context).addNewTransaction,
                        icon: const Icon(
                          Icons.account_circle,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Wallet
                      SettingItemWidget(
                        title: AppLocalizations.of(context).wallet,
                        label: AppLocalizations.of(context).savedWallet,
                        icon: const Icon(
                          Icons.wallet,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Integration
                      SettingItemWidget(
                        title: AppLocalizations.of(context).integration,
                        label: AppLocalizations.of(context)
                            .connectBankAndOtherFinancialService,
                        icon: const Icon(
                          Icons.account_balance,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Currency
                      SettingItemWidget(
                        title: AppLocalizations.of(context).currency,
                        label: AppLocalizations.of(context).changeCurrency,
                        icon: const Icon(
                          Icons.attach_money,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Theme
                      SettingItemWidget(
                        title: AppLocalizations.of(context).theme,
                        label: AppLocalizations.of(context).darkMode,
                        icon: const Icon(
                          Icons.mode_night,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Switch(
                          activeColor: ColorsUtils.grayscale_white_white,
                          activeTrackColor:
                              ColorsUtils.grayscale_gray_shaded_gray,
                          inactiveThumbColor: ColorsUtils.grayscale_white_white,
                          inactiveTrackColor:
                              ColorsUtils.grayscale_white_shaded_white,
                          value: isDark,
                          onChanged: (value) => setState(() {
                            isDark = value;
                          }),
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Security
                      SettingItemWidget(
                        title: AppLocalizations.of(context).security,
                        label: AppLocalizations.of(context)
                            .setSecurityAndPrivacyOption,
                        icon: const Icon(
                          Icons.lock,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.defaultSpace,
                      ),

                      // Support
                      SettingItemWidget(
                        title: AppLocalizations.of(context).support,
                        label: AppLocalizations.of(context).getHelpAndSupport,
                        icon: const Icon(
                          Icons.face,
                          color: ColorsUtils.grayscale_gray_light_gray,
                        ),
                        secondIcon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0,
                          color: Theme.of(context).colorScheme.surface,
                        ),
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
