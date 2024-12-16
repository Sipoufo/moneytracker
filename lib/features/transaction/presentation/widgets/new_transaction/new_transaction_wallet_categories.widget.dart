import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/drop_down_button.widget.dart';

class NewTransactionWalletCategoriesWidget extends StatefulWidget {
  const NewTransactionWalletCategoriesWidget({super.key});

  @override
  State<NewTransactionWalletCategoriesWidget> createState() => _NewTransactionWalletCategoriesWidgetState();
}

class _NewTransactionWalletCategoriesWidgetState extends State<NewTransactionWalletCategoriesWidget> {
  List<String> wallets = [
    "apple wallet",
    "Google Wallet",
    "John Doe’s Wallet",
  ];

  String? selectedWallet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    selectedWallet = wallets[0];
  }

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
                selectedValue: selectedWallet,
                onChanged: (String? value) {
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(SizeUtil.sm_12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondaryContainer,
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
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(SizeUtil.sm_12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.secondaryContainer,
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
