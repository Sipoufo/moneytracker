import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/card.widget.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_categories.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_list.widget.dart';

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
                      placeholder: AppLocalizations.of(context).timeSlot,
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
                                    content: FormatterUtils.formatCurrencyCompact(5436788),
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
                                    content: FormatterUtils.formatCurrencyCompact(5436788),
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
                    const TransactionListWidget(),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.spaceBtwItems_16,
                    ),

                    // Categories part
                    const TransactionCategoriesWidget(),

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
