import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/card.widget.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category_type.enum.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.bloc.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.event.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.state.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_categories.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_list.widget.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final TextEditingController periodController = TextEditingController();
  // DateFormat format = DateFormat("MMMM dd yyyy");
  TransactionFindTypeEnum selectedPeriodValue = TransactionFindTypeEnum.values[2];
  Map<String, dynamic>? selectedPeriodValueAndPeriod;
  String subItemSelected = "${DateTime.now().year}";

  String currentCurrency = "";
  double totalAmount = 0;
  double netBalance = 0;
  double totalIncomeAmount = 0;
  double totalExpenseAmount = 0;

  @override
  void initState() {
    selectedPeriodValueAndPeriod = InformationUtil.periodicValuesAndCorrespondent(context)[2];
    context
        .read<TransactionBloc>()
        .add(TransactionFetchAllByDatesEvent(startDate: DateTime.now(), transactionFindTypeEnum: selectedPeriodValue));
    getCurrentCurrency();
    super.initState();
  }

  getCurrentCurrency() async {
    final prefs = await InitValuesUtil.sharedPreferences;
    setState(() {
      currentCurrency = prefs.getString("currency") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: BlocConsumer<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state is TransactionSuccessFetchAllState) {
              setState(() {
                totalAmount = 0;
                netBalance = 0;
                totalIncomeAmount = 0;
                totalExpenseAmount = 0;

                for (TransactionEntity transaction in state.transactions) {
                  totalAmount += transaction.amount;
                  if (transaction.category.type == TransactionCategoryTypeEnum.income) {
                    totalIncomeAmount += transaction.amount;
                  }
                  if (transaction.category.type == TransactionCategoryTypeEnum.expenses) {
                    totalExpenseAmount += transaction.amount;
                  }
                }

                netBalance = totalIncomeAmount - totalExpenseAmount;
              });
            }
          },
          builder: (context, state) {
            if (state is TransactionLoadingState) {
              return const Center(child: LoadingWidget());
            }
            if (state is TransactionSuccessFetchAllState) {
              return Column(
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
                          child: DropDownButtonWidget<TransactionFindTypeEnum>(
                            placeholder: AppLocalizations.of(context).timeSlot,
                            selectedValue: selectedPeriodValue,
                            onChanged: (TransactionFindTypeEnum? value) {
                              if (value != null) {
                                setState(() {
                                  selectedPeriodValue = value;
                                  subItemSelected;

                                  selectedPeriodValueAndPeriod = InformationUtil.periodicValuesAndCorrespondent(context)
                                      .firstWhere((value) => value['period'] == selectedPeriodValue);
                                });
                              }
                            },
                            values: TransactionFindTypeEnum.values.map<DropdownMenuItem<TransactionFindTypeEnum>>(
                                (TransactionFindTypeEnum transactionFind) {
                              return DropdownMenuItem<TransactionFindTypeEnum>(
                                value: transactionFind,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  child: Text(
                                    AppLocalizations.of(context).localeName == "en"
                                        ? transactionFind.valueEn
                                        : transactionFind.valueFr,
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
                                          DateTime date = DateTime.now();
                                          if (result is DateTimeEnum) {
                                            subItemSelected = result.valueEn;
                                            if (selectedPeriodValue == TransactionFindTypeEnum.monthly) {
                                              date = DateTime(date.year, result.digitalValue);
                                            }
                                          } else {
                                            subItemSelected = "$result";
                                            if (selectedPeriodValue == TransactionFindTypeEnum.daily) {
                                              date = DateTime(date.year, date.month, result);
                                            }
                                            if (selectedPeriodValue == TransactionFindTypeEnum.annually) {
                                              date = DateTime(result);
                                            }
                                          }

                                          context
                                              .read<TransactionBloc>()
                                              .add(TransactionFetchAllByDatesEvent(startDate: date, transactionFindTypeEnum: selectedPeriodValue));
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
                                          color: subItemSelected == (result is DateTimeEnum ? result.valueEn : "$result")
                                              ? ColorsUtils.primary_5
                                              : Theme.of(context).colorScheme.primaryContainer,
                                          border: Border.all(
                                            color: Theme.of(context).colorScheme.secondaryContainer,
                                          ),
                                          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
                                        ),
                                        child: Text(
                                          result is DateTimeEnum ? result.valueEn : "$result",
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                                color: subItemSelected ==
                                                        (result is DateTimeEnum ? result.valueEn : "$result")
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
                                  backgroundColor: netBalance >= 0 ? ColorsUtils.primary_5 : ColorsUtils.danger_5,
                                  padding: const EdgeInsets.all(SizeUtil.lg),
                                  borderRadius: SizeUtil.borderRadiusSm,
                                  title: AppLocalizations.of(context).netBalance,
                                  titleStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        color: ColorsUtils.text_white,
                                      ),
                                  content: FormatterUtils.formatCurrency(netBalance, symbol: currentCurrency),
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
                                          content: FormatterUtils.formatCurrencyCompact(totalIncomeAmount,
                                              symbol: currentCurrency),
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
                                          content: FormatterUtils.formatCurrencyCompact(totalExpenseAmount,
                                              symbol: currentCurrency),
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
                          TransactionListWidget(
                            transactions: state.transactions,
                            currency: currentCurrency,
                          ),
                          //
                          // Spacing
                          const SizedBox(
                            height: SizeUtil.spaceBtwItems_16,
                          ),

                          // Categories part
                          TransactionCategoriesWidget(
                            totalAmount: totalAmount,
                            transactions: state.transactions,
                          ),
                          //
                          // Spacing
                          const SizedBox(
                            height: SizeUtil.spaceBtwItems_24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
