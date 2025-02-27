import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/tag.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class TransactionResumeWidget extends StatelessWidget {
  const TransactionResumeWidget({
    super.key,
    required this.currencySymbol,
    required this.transactionEntity,
  });

  final String currencySymbol;
  final TransactionEntity transactionEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: SizeUtil.sm,
        horizontal: SizeUtil.md,
      ),
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
                      width: SizeUtil.iconXl,
                      height: SizeUtil.iconXl,
                      decoration: BoxDecoration(
                        color: transactionEntity.category.category.backgroundColor,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Center(
                        child: Text(
                          transactionEntity.category.category.emoji,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: SizeUtil.iconMd,
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
                        transactionEntity.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(
                      width: SizeUtil.sm,
                    ),
                    TagWidget(
                      name: AppLocalizations.of(context).localeName == "en" ? transactionEntity.category.type.valueEn : transactionEntity.category.type.valueFr,
                      textStyle:
                          Theme.of(context).textTheme.labelLarge!.copyWith(
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
                FormatterUtils.formatCurrency(transactionEntity.amount, symbol: currencySymbol),
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
                  AppLocalizations.of(context).localeName == "en" ? transactionEntity.category.category.nameEn : transactionEntity.category.category.nameFr,
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
                  AppLocalizations.of(context).localeName == "en" ? transactionEntity.category.type.valueEn : transactionEntity.category.type.valueFr,
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
                  FormatterUtils.formatDate(date: transactionEntity.dateTime),
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
                  FormatterUtils.formatTime(date: transactionEntity.dateTime),
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
                  transactionEntity.note,
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
