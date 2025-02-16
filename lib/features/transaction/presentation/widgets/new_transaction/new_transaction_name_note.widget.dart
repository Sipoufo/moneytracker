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
    required this.updateFields,
    required this.updateTransactionStepIndex,
  });

  final Function(int step) updateTransactionStepIndex;
  final Function({required String selectedName, required String selectedNote}) updateFields;

  @override
  State<NewTransactionNameNoteWidget> createState() => _NewTransactionNameNoteWidgetState();
}

class _NewTransactionNameNoteWidgetState extends State<NewTransactionNameNoteWidget> {
  final TextEditingController transactionNameController = TextEditingController();
  final TextEditingController transactionNoteController = TextEditingController();

  void nextStep() {
    if (transactionNameController.text == "") {
      showSnackBar(context, "Enter the name of transaction !");
      return;
    }
    widget.updateFields(selectedName: transactionNameController.text.trim(), selectedNote: transactionNoteController.text.trim());
    widget.updateTransactionStepIndex(4);
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
                        textInputType: TextInputType.text,
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
                        textInputType: TextInputType.text,
                        controller: transactionNoteController,
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
                  nextStep();
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
