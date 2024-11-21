import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/features/setting/presentation/widgets/header_setting.widget.dart';
import 'package:moneytracker/features/setting/presentation/widgets/setting_item.widget.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const HeaderSettingWidget(),

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
                      const SizedBox(height: SizeUtil.defaultSpace,),

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
                      const SizedBox(height: SizeUtil.defaultSpace,),

                      SettingItemWidget(
                        title: AppLocalizations.of(context).integration,
                        label: AppLocalizations.of(context).connectBankAndOtherFinancialService,
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
                      const SizedBox(height: SizeUtil.defaultSpace,),

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
                      const SizedBox(height: SizeUtil.defaultSpace,),

                      SettingItemWidget(
                        title: AppLocalizations.of(context).theme,
                        label: AppLocalizations.of(context).darkMode,
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
                      const SizedBox(height: SizeUtil.defaultSpace,),

                      SettingItemWidget(
                        title: AppLocalizations.of(context).security,
                        label: AppLocalizations.of(context).setSecurityAndPrivacyOption,
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
                      const SizedBox(height: SizeUtil.defaultSpace,),

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
