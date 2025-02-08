import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';

class WalletSettingItemWidget extends StatelessWidget {
  const WalletSettingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12, vertical: SizeUtil.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
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
                  "Yvan's Wallet",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Indonesian Rupiah (IDR)",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
                Text(
                  FormatterUtils.formatCurrency(5436788),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorsUtils.primary_5,
                  ),
                ),
              ],
            ),
          ),
          // Action button
          IconsUtils.verticalDote(
            context: context,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
