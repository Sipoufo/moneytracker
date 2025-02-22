import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/enums/category_emoji.enum.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category_type.enum.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
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
  String currencySymbol = "";

  // Attributes of new transaction part
  // Part 1 : Wallet
  SettingWalletEntity? wallet;
  TransactionCategoryTypeEnum? typeCategory;
  CategoryEnum? category;

  // Part 2 : Amount
  String amountIcon = "";
  double amount = 0;

  // Part 3 : DateTime
  DateTime dateTime = DateTime.now();

  // Part 2 : Name and note
  String name = "";
  String note = "";

  List<Widget> transactionStepWidget = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadCurrencySymbol();
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
        updateFields: updateFieldsPart3,
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
      NewTransactionNameNoteWidget(
        updateFields: updateFieldsPart4,
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
    ];
  }

  void updateFieldsPart1(
      {required SettingWalletEntity selectWallet,
      required TransactionCategoryTypeEnum selectTypeCategory,
      required CategoryEnum selectCategory}) {
    // Update wallet value
    setState(() {
      wallet = selectWallet;
    });

    // Update type of category value
    setState(() {
      typeCategory = selectTypeCategory;
    });

    // Update category value
    setState(() {
      category = selectCategory;
    });
  }

  void updateFieldsPart2({required String selectedAmountIcon, required double selectedAmount}) {
    // Update amount value
    setState(() {
      amount = selectedAmount;
    });
    // Update amountIcon value
    setState(() {
      amountIcon = selectedAmountIcon;
    });
  }

  void updateFieldsPart3({required DateTime selectedDateTime}) {
    // Update dateTime value
    setState(() {
      dateTime = selectedDateTime;
    });
  }

  void updateFieldsPart4({required String selectedName, required String selectedNote}) {
    // Update name value
    setState(() {
      name = selectedName;
    });
    // Update note value
    setState(() {
      note = selectedNote;
    });

    transactionStepWidget.add(
      NewTransactionReviewsWidget(
        currencySymbol: currencySymbol,
        transactionEntity: TransactionEntity(
          name: name,
          wallet: wallet!,
          category: TransactionCategoryModel(category: category!, type: typeCategory!),
          amount: amount,
          amountIcon: amountIcon,
          dateTime: dateTime,
          note: note,
        ),
        updateTransactionStepIndex: updateTransactionStepIndex,
      ),
    );
  }

  // Update step
  void updateTransactionStepIndex(int step) {
    setState(() {
      transactionStepIndex = step;
    });
  }

  loadCurrencySymbol() async {
    final prefs = await InitValuesUtil.sharedPreferences;
    setState(() {
      currencySymbol = prefs.getString("currency") ?? "";
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
                  firstIcon: IconsUtils.back(
                      context: context,
                      onTap: () {
                        context.read<ApplicationNavigationCubit>().changePage(0);
                        Navigator.pop(context);
                      }),
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
