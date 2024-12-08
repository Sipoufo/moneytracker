import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class TransactionRankWidget extends StatelessWidget {
  const TransactionRankWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeUtil.md),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).rank,
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // Separator
          const Separator(),

          // Income
          Text(
            AppLocalizations.of(context).income,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          Container(
            padding: const EdgeInsets.all(SizeUtil.sm_12),
            decoration: BoxDecoration(
              color: ColorsUtils.gossip,
              borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1. Investment",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
                  ),
                ),
                Text(
                  "70%",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
                  ),
                ),
              ],
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          // Expense
          Text(
            AppLocalizations.of(context).expenses,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          Container(
            padding: const EdgeInsets.all(SizeUtil.sm_12),
            decoration: BoxDecoration(
              color: ColorsUtils.malibu,
              borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1. Vehicle",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
                  ),
                ),
                Text(
                  "20%",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
                  ),
                ),
              ],
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          Container(
            padding: const EdgeInsets.all(SizeUtil.sm_12),
            decoration: BoxDecoration(
              color: ColorsUtils.broom,
              borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2. Food & drink",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
                  ),
                ),
                Text(
                  "20%",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ColorsUtils.text_black,
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