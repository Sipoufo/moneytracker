import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class TransactionCategoriesWidget extends StatelessWidget {
  const TransactionCategoriesWidget({
    super.key,
    required this.totalAmount,
    required this.transactions,
  });

  final double totalAmount;
  final List<TransactionEntity> transactions;

  List<PieChartSectionData> showingSections() {
    List<PieChartSectionData> result = [];

    for (TransactionEntity transaction in transactions) {
      result.add(
        PieChartSectionData(
          color: transaction.category.category.backgroundColor,
          value: (transaction.amount <= 0 || totalAmount <= 0) ? 0 : transaction.amount / totalAmount,
          title: transaction.category.category.nameFr,
          radius: 60,
          titleStyle: const TextStyle(
            color: Colors.transparent,
          ),
          badgeWidget: Center(
            child: Text(
              transaction.category.category.emoji,
              style: const TextStyle(
                color: Colors.white,
                fontSize: SizeUtil.iconMd,
              ),
            ),
          ),
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: SizeUtil.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).categories,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_16,
          ),

          // Chart
          Column(
            children: [
              SizedBox(
                height: 300,
                child: PieChart(
                  PieChartData(
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: MediaQuery.of(context).size.width / 6,
                    sections: showingSections(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: showingSections().map<Widget>((value) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_10),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: value.color,
                            borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl),
                          ),
                        ),
                        const SizedBox(
                          width: SizeUtil.xs,
                        ),
                        Text(
                          value.title,
                          style: Theme.of(context).textTheme.displayLarge,
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),

          // Spacing
          const SizedBox(
            height: SizeUtil.spaceBtwItems_16,
          ),

          // Rank
          // TransactionRankWidget(totalAmount: widget.totalAmount, transactions: widget.transactions),
        ],
      ),
    );
  }
}
