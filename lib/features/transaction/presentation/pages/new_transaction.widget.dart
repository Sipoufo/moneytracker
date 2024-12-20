import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/tag.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/new_transaction_wallet_categories.widget.dart';

class NewTransactionWidget extends StatefulWidget {
  const NewTransactionWidget({super.key});

  @override
  State<NewTransactionWidget> createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  double? containWidgetHeight;
  int transactionStepIndex = 0;

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
                            children: InitValuesUtil.transactionsSteps(context).map<Widget>((step) {
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
                                          color: step == InitValuesUtil.transactionsSteps(context)[transactionStepIndex]
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
                                              color: step ==
                                                      InitValuesUtil.transactionsSteps(context)[transactionStepIndex]
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
                            }).toList(),
                          ),
                        ),
                      ),

                      // Contain new transaction
                      const Expanded(
                        child: SingleChildScrollView(child: NewTransactionWalletCategoriesWidget()),
                      ),

                      // Bottom buttons
                      Column(
                        children: [
                          ButtonWidget(
                            title: AppLocalizations.of(context).next,
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                            onTap: () {},
                            padding: const EdgeInsets.all(0),
                            color: ColorsUtils.primary_5,
                          ),
                          ButtonWidget(
                            title: AppLocalizations.of(context).cancel,
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                            onTap: () {},
                            padding: const EdgeInsets.all(0),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Bottom part
            Positioned(
              bottom: 0,
              child: Container(
                height: containWidgetHeight ?? (MediaQuery.of(context).size.height / 2.4),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(SizeUtil.borderRadiusXl),
                    topRight: Radius.circular(SizeUtil.borderRadiusXl),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsUtils.grayscale_black_black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(SizeUtil.md, 0, SizeUtil.md, SizeUtil.sm_12),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pan button
                        GestureDetector(
                          onPanUpdate: (detail) {
                            setState(() {
                              double value =
                                  (containWidgetHeight ??= MediaQuery.of(context).size.height / 2) - detail.delta.dy;
                              if (containWidgetHeight == null) {
                                containWidgetHeight = value;
                              } else if (value > 300) {
                                containWidgetHeight = value;
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: SizeUtil.lg),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: SizeUtil.buttonHeight_10,
                                  width: SizeUtil.buttonWidth_64,
                                  decoration: const BoxDecoration(
                                      color: ColorsUtils.grayscale_white_dark_white,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(SizeUtil.sm),
                                        right: Radius.circular(SizeUtil.sm),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Spacing
                        const SizedBox(
                          height: SizeUtil.lg,
                        ),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TagWidget(
                                  name: AppLocalizations.of(context).income,
                                  textStyle:
                                  Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: ColorsUtils.text_black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  backgroundColor: ColorsUtils.primary_2,
                                ),

                                // Spacing
                                const SizedBox(
                                  height: SizeUtil.lg,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
