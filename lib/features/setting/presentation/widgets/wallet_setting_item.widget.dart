import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.bloc.dart';
import 'package:moneytracker/features/setting/presentation/blocs/wallet/setting_wallet.event.dart';

class WalletSettingItemWidget extends StatelessWidget {
  const WalletSettingItemWidget({super.key, required this.settingWalletEntity});

  final SettingWalletEntity settingWalletEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12, vertical: SizeUtil.md),
      decoration: BoxDecoration(
        color: settingWalletEntity.isSelected ? ColorsUtils.primary_8 : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Information
          Expanded(
            child: Column(
              spacing: SizeUtil.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settingWalletEntity.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${settingWalletEntity.country.name} (${settingWalletEntity.country.currency.symbol})",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                ),
                Text(
                  FormatterUtils.formatCurrency(settingWalletEntity.amount),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ColorsUtils.primary_5,
                      ),
                ),
              ],
            ),
          ),
          // Action button
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.more_vert,
                size: SizeUtil.lg,
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              isExpanded: false,
              isDense: true,
              style: Theme.of(context).textTheme.bodySmall,
              dropdownColor: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.all(0),
              onChanged: (value) {},
              items: <DropdownMenuItem<String>>[
                if (!settingWalletEntity.isSelected)
                  DropdownMenuItem(
                    value: "Set as default",
                    onTap: () => context.read<SettingWalletBloc>().add(SettingChangeDefaultWalletEvent(settingWalletEntity.id)),
                    child: Text(AppLocalizations.of(context).setAsDefault),
                  ),
                DropdownMenuItem(
                  value: "Delete",
                  onTap: () => context.read<SettingWalletBloc>().add(SettingDeleteWalletEvent(settingWalletEntity.id)),
                  child: Row(
                    spacing: SizeUtil.spaceBtwItems_12,
                    children: [
                      const Icon(
                        Icons.delete,
                        size: SizeUtil.lg,
                      ),
                      Text(AppLocalizations.of(context).deleteWallet),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
