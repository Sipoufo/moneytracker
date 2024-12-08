import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_rank.widget.dart';

class TransactionCategoriesWidget extends StatefulWidget {
  const TransactionCategoriesWidget({super.key});

  @override
  State<TransactionCategoriesWidget> createState() => _TransactionCategoriesWidgetState();
}

class _TransactionCategoriesWidgetState extends State<TransactionCategoriesWidget> {

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: ColorsUtils.broom,
        value: 10,
        title: 'Food & Drink',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.transparent,
        ),
        badgeWidget: Image.asset(
          "assets/pictures/categories/food.png",
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        ),
      ),
      PieChartSectionData(
        color: ColorsUtils.malibu,
        value: 20,
        title: 'Vehicle',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.transparent,
        ),
        badgeWidget: Image.asset(
          "assets/pictures/categories/vehicle.png",
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        ),
      ),
      PieChartSectionData(
        color: ColorsUtils.gossip,
        value: 70,
        title: 'Investment',
        radius: 60,
        titleStyle: const TextStyle(
          color: Colors.transparent,
        ),
        badgeWidget: Image.asset(
          "assets/pictures/categories/investment.png",
          height: 30,
          width: 30,
          fit: BoxFit.contain,
        ),
      ),
    ];
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
          const TransactionRankWidget()
        ],
      ),
    );
  }
}
