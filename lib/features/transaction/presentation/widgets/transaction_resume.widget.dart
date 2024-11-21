import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/tag.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class TransactionResumeWidget extends StatelessWidget {
  const TransactionResumeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizeUtil.sm),
      padding: const EdgeInsets.all(SizeUtil.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondaryContainer,
            spreadRadius: 1,
            blurRadius: 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left part
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(SizeUtil.md),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsUtils.primary_2,
                      ),
                      child: Container(
                        width: SizeUtil.defaultSpace,
                        height: SizeUtil.defaultSpace,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/pictures/logo/logo.png"),
                            alignment: Alignment.center,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: SizeUtil.sm,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Stock Dividend",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(
                      width: SizeUtil.sm,
                    ),
                    TagWidget(
                      name: AppLocalizations.of(context).income,
                      textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: ColorsUtils.text_black,
                            fontWeight: FontWeight.w700,
                          ),
                      backgroundColor: ColorsUtils.primary_2,
                    )
                  ],
                ),
              ),
              // Dots part
              IconsUtils.option(context: context, onTap: () {}),
            ],
          ),

          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Amount
          Wrap(
            spacing: SizeUtil.sm,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context).amount,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
              Text(
                FormatterUtils.formatCurrency(120000),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorsUtils.primary_5,
                ),
              ),
            ],
          ),

          // Separator
          Container(
            margin: const EdgeInsets.only(top: SizeUtil.sm),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).categories,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),

              // Spacing
              const SizedBox(
                width: SizeUtil.sm,
              ),

              Expanded(
                child: Text(
                  "Investment",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).type,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),

              // Spacing
              const SizedBox(
                width: SizeUtil.sm,
              ),

              Expanded(
                child: Text(
                  "Manual",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).date,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),

              // Spacing
              const SizedBox(
                width: SizeUtil.sm,
              ),

              Expanded(
                child: Text(
                  FormatterUtils.formatDate(),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).time,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),

              // Spacing
              const SizedBox(
                width: SizeUtil.sm,
              ),

              Expanded(
                child: Text(
                  FormatterUtils.formatTime(),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.defaultSpace,
          ),

          // Categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context).note,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
              ),

              // Spacing
              const SizedBox(
                width: SizeUtil.sm,
              ),

              Expanded(
                child: Text(
                  "Dividend from AAPL stock",
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
