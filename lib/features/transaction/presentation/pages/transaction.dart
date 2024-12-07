import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/card.widget.dart';
import 'package:moneytracker/core/widgets/daily_transaction.widget.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final TextEditingController periodController = TextEditingController();
  String? selectedPeriodValue;
  Map<String, dynamic>? selectedPeriodValueAndPeriod;
  String subItemSelected = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    selectedPeriodValue = InformationUtil.periodicValues(context)[0];
    selectedPeriodValueAndPeriod = InformationUtil.periodicValuesAndCorrespondent(context)
        .firstWhere((value) => value['period'] == selectedPeriodValue);
    subItemSelected = selectedPeriodValueAndPeriod?["values"][0];
  }

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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of transaction recap page
            HeaderWidget(
              title: AppLocalizations.of(context).transactionRecap,
              secondIcon: IconsUtils.filter(context: context, onTap: () {}),
              thirdIcon: IconsUtils.search(context: context, onTap: () {}),
            ),

            // First filter option
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SizeUtil.sm_12,
              ),
              child: Column(
                children: [
                  // Drop down button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SizeUtil.md,
                    ),
                    child: DropDownButtonWidget<String?>(
                      selectedValue: selectedPeriodValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPeriodValue = value ?? "";
                          subItemSelected = "";
                          selectedPeriodValueAndPeriod = InformationUtil.periodicValuesAndCorrespondent(context)
                              .firstWhere((value) => value['period'] == selectedPeriodValue);
                        });
                      },
                      values: InformationUtil.periodicValues(context).map<DropdownMenuItem<String>>((String period) {
                        return DropdownMenuItem<String>(
                          value: period,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            child: Text(
                              period,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Spacing
                  const SizedBox(
                    height: SizeUtil.spaceBtwItems_16,
                  ),

                  // Sub items list
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: selectedPeriodValueAndPeriod != null
                          ? selectedPeriodValueAndPeriod!["values"].map<Widget>((result) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    subItemSelected = "$result";
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: SizeUtil.md_14,
                                    vertical: SizeUtil.sm,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: SizeUtil.md_14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: subItemSelected == "$result"
                                        ? ColorsUtils.primary_5
                                        : Theme.of(context).colorScheme.primaryContainer,
                                    border: Border.all(
                                      color: Theme.of(context).colorScheme.secondaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                                  ),
                                  child: Text(
                                    "$result",
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: subItemSelected == "$result"
                                              ? ColorsUtils.text_white
                                              : Theme.of(context).colorScheme.surface,
                                        ),
                                  ),
                                ),
                              );
                            }).toList()
                          : [const SizedBox()],
                    ),
                  ),
                ],
              ),
            ),

            // Spacing
            const SizedBox(
              height: SizeUtil.spaceBtwItems_16,
            ),

            // Body of home page
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Financial recap
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizeUtil.md,
                      ),
                      child: Column(
                        children: [
                          // Net balance card
                          CardWidget(
                            backgroundColor: ColorsUtils.primary_5,
                            padding: const EdgeInsets.all(SizeUtil.lg),
                            borderRadius: SizeUtil.borderRadiusSm,
                            title: AppLocalizations.of(context).netBalance,
                            titleStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: ColorsUtils.text_white,
                                ),
                            content: FormatterUtils.formatCurrency(5436788),
                            contextStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: ColorsUtils.text_white,
                                ),
                            isHorizontalCenter: false,
                          ),
                          const SizedBox(
                            height: SizeUtil.spaceBtwItems_16,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: CardWidget(
                                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                    padding: const EdgeInsets.all(SizeUtil.lg),
                                    borderRadius: SizeUtil.borderRadiusSm,
                                    title: AppLocalizations.of(context).income,
                                    titleStyle: Theme.of(context).textTheme.bodySmall,
                                    content: FormatterUtils.formatCurrency(5436788),
                                    contextStyle: Theme.of(context).textTheme.titleLarge,
                                    icon: IconsUtils.incomeIcon,
                                  ),
                                ),
                                const SizedBox(
                                  width: SizeUtil.spaceBtwItems_16,
                                ),
                                Expanded(
                                  child: CardWidget(
                                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                                    padding: const EdgeInsets.all(SizeUtil.lg),
                                    borderRadius: SizeUtil.borderRadiusSm,
                                    title: AppLocalizations.of(context).expenses,
                                    titleStyle: Theme.of(context).textTheme.bodySmall,
                                    content: FormatterUtils.formatCurrency(5436788),
                                    contextStyle: Theme.of(context).textTheme.titleLarge,
                                    icon: IconsUtils.expenseIcon,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_24,
                    ),

                    // Transaction list
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: SizeUtil.md,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context).transactionList,
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.left,
                          ),

                          // Yesterday transaction
                          Padding(
                            padding: const EdgeInsets.only(
                              top: SizeUtil.md,
                            ),
                            child: DailyTransactionWidget(
                              dateTime: DateTime.now().copyWith(
                                day: DateTime.now().day - 2,
                              ),
                            ),
                          ),

                          // Today transaction
                          Padding(
                            padding: const EdgeInsets.only(
                              top: SizeUtil.md,
                            ),
                            child: DailyTransactionWidget(
                              dateTime: DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_16,
                    ),

                    // Categories part
                    Container(
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
                                        Text(value.title, style: Theme.of(context).textTheme.displayLarge,)
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
                          Container(
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
                          )
                        ],
                      ),
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
