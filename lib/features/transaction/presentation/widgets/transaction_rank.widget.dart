import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category_type.enum.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class TransactionRankWidget extends StatelessWidget {
  const TransactionRankWidget({
    super.key,
    required this.totalAmount,
    required this.transactions,
  });

  final double totalAmount;
  final List<TransactionEntity> transactions;

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

          Column(
            spacing: SizeUtil.spaceBtwItems_12,
            children: transactions.mapIndexed((index, transaction) {
              if (transaction.category.type == TransactionCategoryTypeEnum.income) {
                return Container(
                  padding: const EdgeInsets.all(SizeUtil.sm_12),
                  decoration: BoxDecoration(
                    color: transaction.category.category.backgroundColor,
                    borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1} ${AppLocalizations.of(context).localeName == "en" ? transaction.category.category.nameEn : transaction.category.category.nameFr}",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsUtils.text_black,
                        ),
                      ),
                      Text(
                        "${FormatterUtils.formatCurrency(transaction.amount / totalAmount * 100, symbol: "")}%",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsUtils.text_black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            }).toList(),
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

          Column(
            spacing: SizeUtil.spaceBtwItems_12,
            children: transactions.mapIndexed((index, transaction) {
              if (transaction.category.type == TransactionCategoryTypeEnum.expenses) {
                return Container(
                  padding: const EdgeInsets.all(SizeUtil.sm_12),
                  decoration: BoxDecoration(
                    color: transaction.category.category.backgroundColor,
                    borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${index + 1} ${AppLocalizations.of(context).localeName == "en" ? transaction.category.category.nameEn : transaction.category.category.nameFr}",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsUtils.text_black,
                        ),
                      ),
                      Text(
                        "${FormatterUtils.formatCurrency(transaction.amount / totalAmount * 100, symbol: "")}%",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsUtils.text_black,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            }).toList(),
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_12,
          ),
        ],
      ),
    );
  }
}