import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
    super.key,
    required this.transactionType,
    required this.transactionCategory,
    required this.transactionName,
    required this.amount,
  });

  final String transactionType;
  final String transactionCategory;
  final String transactionName;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/transaction/transaction-detail"),
      child: Container(
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Label
              Container(
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(SizeUtil.borderRadiusMd)),
                  color: transactionType == "income" ? ColorsUtils.primary_5 : ColorsUtils.danger_4,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizeUtil.md,
                    vertical: SizeUtil.md,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).investment,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: !HelperFunctions.isDarkMode(context)
                                          ? ColorsUtils.grayscale_gray_light_gray
                                          : ColorsUtils.grayscale_gray_pale_gray,
                                    ),
                          ),
                          const SizedBox(
                            height: SizeUtil.xs,
                          ),
                          Text(
                            "Food Sales",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Text(
                        "${transactionType == "income" ? "+" : "-"} ${FormatterUtils.formatCurrency(amount)}",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: transactionType == "income" ? ColorsUtils.primary_5 : ColorsUtils.danger_4,
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
