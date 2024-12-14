import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';

class NewBudgetPage1Widget extends StatelessWidget {
  const NewBudgetPage1Widget({
    super.key,
    required this.budgetNameController,
  });

  final TextEditingController budgetNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFormWidget(
          label: AppLocalizations.of(context).budgetName,
          placeholder: AppLocalizations.of(context).entreBudgetName,
          textInputType: TextInputType.text,
          controller: budgetNameController,
        )
      ],
    );
  }
}
