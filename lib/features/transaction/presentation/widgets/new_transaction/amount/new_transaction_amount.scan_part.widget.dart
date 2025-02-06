import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class NewTransactionAmountScanPartWidget extends StatelessWidget {
  const NewTransactionAmountScanPartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SizeUtil.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Separator
            Row(
              spacing: SizeUtil.sm_12,
              children: [
                const Expanded(child: Separator()),
                Text(
                  AppLocalizations.of(context).or,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Expanded(child: Separator()),
              ],
            ),

            // Button
            ButtonWidget(
              title: AppLocalizations.of(context).scanReceipt,
              textStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () {},
              padding: const EdgeInsets.symmetric(vertical: SizeUtil.md),
              color: Theme.of(context).colorScheme.primaryContainer,
              icon: IconsUtils.scan(context: context),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SizeUtil.sm,
              children: [
                IconsUtils.info(context: context),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).createTransactionAmount,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
