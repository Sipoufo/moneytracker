import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/amount/new_transaction_amount.icon.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/new_transaction/amount/new_transaction_amount.scan_part.widget.dart';

class NewTransactionAmountWidget extends StatefulWidget {
  const NewTransactionAmountWidget({
    super.key,
    required this.updateFields,
    required this.updateTransactionStepIndex,
  });

  final Function(int step) updateTransactionStepIndex;
  final Function({String? amountIcon, double? amount}) updateFields;

  @override
  State<NewTransactionAmountWidget> createState() => _NewTransactionAmountWidgetState();
}

class _NewTransactionAmountWidgetState extends State<NewTransactionAmountWidget> {
  final TextEditingController amountValueController = TextEditingController();
  bool showAmountIcons = false;
  String? selectedAmountIcon;

  // Update selected amount icon
  void updateSelectedAmountIcon(String amountIcon) {
    setState(() {
      selectedAmountIcon = amountIcon;
      showAmountIcons = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeUtil.sm_12,
        vertical: SizeUtil.md,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeUtil.sm,
                    children: [
                      // Wallet
                      Text(
                        AppLocalizations.of(context).amount,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      // Contain
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: SizeUtil.sm,
                        children: [
                          // Amount icon
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showAmountIcons = !showAmountIcons;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(SizeUtil.sm_12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primaryContainer,
                                border: Border.all(
                                  color: showAmountIcons
                                      ? ColorsUtils.primary_5
                                      : Theme.of(context).colorScheme.secondaryContainer,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(SizeUtil.borderRadiusMd),
                                ),
                              ),
                              child: Row(
                                children: [
                                  selectedAmountIcon == null
                                      ? Text(
                                          "?",
                                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                color: Theme.of(context).colorScheme.surface,
                                              ),
                                        )
                                      : Image(
                                          image: AssetImage(selectedAmountIcon!),
                                          height: SizeUtil.xl,
                                          width: SizeUtil.xl,
                                        ),

                                  // Spacing
                                  const SizedBox(
                                    width: SizeUtil.sm,
                                  ),

                                  showAmountIcons
                                      ? IconsUtils.arrowUp(context: context)
                                      : IconsUtils.arrowDown(context: context),
                                ],
                              ),
                            ),
                          ),

                          // Value
                          Expanded(
                            child: InputFormWidget(
                              placeholder: AppLocalizations.of(context).enterNewAmount,
                              textInputType: TextInputType.number,
                              controller: amountValueController,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  // Icons items
                  if (showAmountIcons)
                    NewTransactionAmountIconWidget(
                      updateSelectedAmountIcon: updateSelectedAmountIcon,
                    ),

                  // Scan receipt
                  if (!showAmountIcons) const NewTransactionAmountScanPartWidget(),
                ],
              ),
            ),
          ),
          Column(
            children: [
              ButtonWidget(
                title: AppLocalizations.of(context).next,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  if (amountValueController.text == "") {
                    showSnackBar(context, "Enter the value of amount !");
                  } else if (selectedAmountIcon == null) {
                    showSnackBar(context, "Select icon for your transaction !");
                  } else {

                  }
                },
                padding: const EdgeInsets.all(0),
                color: ColorsUtils.primary_5,
              ),
              ButtonWidget(
                title: AppLocalizations.of(context).previous,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  widget.updateTransactionStepIndex(0);
                },
                padding: const EdgeInsets.all(0),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
