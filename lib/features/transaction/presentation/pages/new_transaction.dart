import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/amount/new_transaction_amount.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/date&time/new_transaction_date_time.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/new_transaction_name_note.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/new_transaction_review.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/new_transaction_wallet_categories.widget.dart';

class NewTransactionWidget extends StatefulWidget {
  const NewTransactionWidget({super.key});

  @override
  State<NewTransactionWidget> createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  double? containWidgetHeight;
  int transactionStepIndex = 0;
  bool editCategory = false;

  // Attributes of new transaction part
  // Part 1 : Wallet
  String? wallet;
  String? typeCategory;
  String? category;

  // Part 2 : Amount
  String? amountIcon;
  String? amount;

  List<Widget> transactionStepWidget = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    transactionStepWidget = [
      NewTransactionWalletCategoriesWidget(
        selectedWallet: "apple wall",
        updateFields: updateFieldsPart1,
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
      NewTransactionAmountWidget(
        updateFields: updateFieldsPart2,
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
      NewTransactionDateTimeWidget(
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
      NewTransactionNameNoteWidget(
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
      NewTransactionReviewsWidget(
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
    ];
  }

  void updateFieldsPart1({String? selectWallet, String? selectTypeCategory, String? selectCategory}) {
    // Update wallet value
    if (selectWallet != null) {
      setState(() {
        wallet = selectWallet;
      });
    }

    // Update type of category value
    if (selectTypeCategory != null) {
      setState(() {
        typeCategory = selectTypeCategory;
      });
    }

    // Update category value
    if (selectCategory != null) {
      setState(() {
        category = selectCategory;
      });
    }
  }

  void updateFieldsPart2({String? amountIcon, double? amount}) {
    // Update amountIcon value
    if (amountIcon != null) {
      setState(() {
        amountIcon = amountIcon;
      });
    }

    // Update amount value
    if (amount != null) {
      setState(() {
        amount = amount;
      });
    }
  }

  // Update step
  void updateTransactionStepIndex(int step) {
    setState(() {
      transactionStepIndex = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header of transaction detail page
                HeaderWidget(
                  title: AppLocalizations.of(context).newTransaction,
                  firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Transactions steps
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: SizeUtil.sm_12),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: InitValuesUtil.transactionsSteps(context).mapIndexed<Widget>(
                              (index, step) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    step == InitValuesUtil.transactionsSteps(context)[0]
                                        ? const SizedBox(
                                            width: SizeUtil.md,
                                          )
                                        : const SizedBox(),
                                    Text(
                                      step,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                            color: transactionStepIndex >= index
                                                ? ColorsUtils.primary_5
                                                : Theme.of(context).colorScheme.onPrimary,
                                          ),
                                    ),
                                    step !=
                                            InitValuesUtil.transactionsSteps(
                                                context)[InitValuesUtil.transactionsSteps(context).length - 1]
                                        ? Container(
                                            width: SizeUtil.md,
                                            margin: const EdgeInsets.symmetric(horizontal: SizeUtil.sm),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: transactionStepIndex >= index
                                                    ? ColorsUtils.primary_5
                                                    : Theme.of(context).colorScheme.onPrimary,
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    step ==
                                            InitValuesUtil.transactionsSteps(
                                                context)[InitValuesUtil.transactionsSteps(context).length - 1]
                                        ? const SizedBox(
                                            width: SizeUtil.md,
                                          )
                                        : const SizedBox(),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),

                      // Contain new transaction
                      Expanded(
                        child: transactionStepWidget[transactionStepIndex],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
