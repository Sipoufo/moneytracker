import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';

class NewTransactionNameNoteWidget extends StatefulWidget {
  const NewTransactionNameNoteWidget({
    super.key,
    required this.updateTransactionStepIndex,
  });

  final Function(int step) updateTransactionStepIndex;

  @override
  State<NewTransactionNameNoteWidget> createState() => _NewTransactionNameNoteWidgetState();
}

class _NewTransactionNameNoteWidgetState extends State<NewTransactionNameNoteWidget> {
  final TextEditingController transactionNameController = TextEditingController();

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
                spacing: SizeUtil.defaultSpace,
                children: [
                  // Transaction name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeUtil.sm,
                    children: [
                      // Wallet
                      Text(
                        AppLocalizations.of(context).transactionName,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      // Contain
                      InputFormWidget(
                        placeholder: AppLocalizations.of(context).enterYourTransactionName,
                        textInputType: TextInputType.number,
                        controller: transactionNameController,
                      ),
                    ],
                  ),
                  // Note
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeUtil.sm,
                    children: [
                      // Wallet
                      Text(
                        "${AppLocalizations.of(context).note} (${AppLocalizations.of(context).optional})",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),

                      // Contain
                      InputFormWidget(
                        placeholder: AppLocalizations.of(context).enterYourTransactionNote,
                        textInputType: TextInputType.number,
                        controller: transactionNameController,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Button button
          Column(
            children: [
              ButtonWidget(
                title: AppLocalizations.of(context).next,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  if (transactionNameController.text == "") {
                    showSnackBar(context, "Enter the name of transaction !");
                  } else {
                    widget.updateTransactionStepIndex(4);
                  }
                },
                padding: const EdgeInsets.all(SizeUtil.md),
                color: ColorsUtils.primary_5,
              ),
              ButtonWidget(
                title: AppLocalizations.of(context).previous,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  widget.updateTransactionStepIndex(2);
                },
                padding: const EdgeInsets.all(SizeUtil.md),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
