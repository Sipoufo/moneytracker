import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';

class NewTransactionWalletCategoriesWidget extends StatefulWidget {
  const NewTransactionWalletCategoriesWidget({
    super.key,
    this.selectedWallet,
    required this.updateFields,
  });

  final String? selectedWallet;
  final Function updateFields;

  @override
  State<NewTransactionWalletCategoriesWidget> createState() => _NewTransactionWalletCategoriesWidgetState();
}

class _NewTransactionWalletCategoriesWidgetState extends State<NewTransactionWalletCategoriesWidget> {
  String? selectedWallet;
  String? selectedTypeCategory;

  final List<String> wallets = [
    "apple wallet",
    "Google Wallet",
    "John Doe’s Wallet",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Wallet
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeUtil.sm_12,
            vertical: SizeUtil.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet
              Text(
                AppLocalizations.of(context).wallet,
                style: Theme.of(context).textTheme.titleSmall,
              ),

              // Spacing
              const SizedBox(
                height: SizeUtil.sm,
              ),

              DropDownButtonWidget<String?>(
                placeholder: AppLocalizations.of(context).wallet,
                selectedValue: selectedWallet,
                onChanged: (String? value) {
                  widget.updateFields(selectWallet: value ?? "");
                  setState(() {
                    selectedWallet = value ?? "";
                  });
                },
                values: wallets.map<DropdownMenuItem<String>>((String wallet) {
                  return DropdownMenuItem<String>(
                    value: wallet,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: Text(
                        wallet,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),

        // Spacing
        const SizedBox(
          height: SizeUtil.sm,
        ),

        // Categories types
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeUtil.sm_12,
            vertical: SizeUtil.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).chooseCategory,
                style: Theme.of(context).textTheme.titleSmall,
              ),

              // Spacing
              const SizedBox(
                height: SizeUtil.sm_12,
              ),

              if (selectedWallet != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.updateFields(selectTypeCategory: AppLocalizations.of(context).income);
                          setState(() {
                            selectedTypeCategory = AppLocalizations.of(context).income;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(SizeUtil.sm_12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: selectedTypeCategory == AppLocalizations.of(context).income
                                  ? ColorsUtils.primary_5
                                  : Theme.of(context).colorScheme.secondaryContainer,
                            ),
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context).income,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),

                              // Spacing
                              const SizedBox(
                                height: SizeUtil.sm,
                              ),

                              Container(
                                width: SizeUtil.buttonWidth_48,
                                height: SizeUtil.buttonWidth_48,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/pictures/categories/income.png"),
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Spacing
                    const SizedBox(
                      width: SizeUtil.md,
                    ),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget.updateFields(selectTypeCategory: AppLocalizations.of(context).expenses);
                          setState(() {
                            selectedTypeCategory = AppLocalizations.of(context).expenses;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(SizeUtil.sm_12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: selectedTypeCategory == AppLocalizations.of(context).expenses
                                  ? ColorsUtils.primary_5
                                  : Theme.of(context).colorScheme.secondaryContainer,
                            ),
                            color: Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context).expenses,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),

                              // Spacing
                              const SizedBox(
                                height: SizeUtil.sm,
                              ),

                              Container(
                                width: SizeUtil.buttonWidth_48,
                                height: SizeUtil.buttonWidth_48,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/pictures/categories/expense.png"),
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ],
    );
  }
}
