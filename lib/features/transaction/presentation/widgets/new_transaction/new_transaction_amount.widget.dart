import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';

class NewTransactionAmountWidget extends StatefulWidget {
  const NewTransactionAmountWidget({super.key});

  @override
  State<NewTransactionAmountWidget> createState() => _NewTransactionAmountWidgetState();
}

class _NewTransactionAmountWidgetState extends State<NewTransactionAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeUtil.sm_12,
        vertical: SizeUtil.md,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Amount
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Wallet
                    Text(
                      AppLocalizations.of(context).wallet,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.sm,
                    ),

                    // Contain
                    Container(
                      padding: const EdgeInsets.all(SizeUtil.sm_12),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondaryContainer,
                          ),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(SizeUtil.borderRadiusMd))
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              ButtonWidget(
                title: AppLocalizations.of(context).next,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {},
                padding: const EdgeInsets.all(0),
                color: ColorsUtils.primary_5,
              ),
              ButtonWidget(
                title: AppLocalizations.of(context).cancel,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
