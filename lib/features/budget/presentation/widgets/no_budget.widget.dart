import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class NoBudgetWidget extends StatelessWidget {
  const NoBudgetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
      width: double.infinity,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context).yourBudget,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_24,
          ),

          Center(
            child: Image.asset(
              "assets/pictures/others/no-budget.png",
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          Text(
            AppLocalizations.of(context).notBudgetTitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),

          Text(
            AppLocalizations.of(context).notBudgetDescription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}