import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';

class NewBudgetPage1Widget extends StatefulWidget {
  const NewBudgetPage1Widget({
    super.key,
    required this.name,
    required this.nextPage,
    required this.updateFieldsState1,
  });

  final String name;
  final void Function() nextPage;
  final void Function(String nameField) updateFieldsState1;

  @override
  State<NewBudgetPage1Widget> createState() => _NewBudgetPage1WidgetState();
}

class _NewBudgetPage1WidgetState extends State<NewBudgetPage1Widget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController budgetNameController = TextEditingController();

  @override
  void initState() {
    budgetNameController.value = TextEditingValue(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        spacing: SizeUtil.spaceBtwItems_4,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    InputFormWidget(
                      label: AppLocalizations.of(context).budgetName,
                      placeholder: AppLocalizations.of(context).entreBudgetName,
                      textInputType: TextInputType.text,
                      controller: budgetNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field can't be empty !";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: Column(
              spacing: SizeUtil.spaceBtwItems_24,
              children: [
                ButtonWidget(
                  title: AppLocalizations.of(context).next,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  onTap: () {
                    if (formKey.currentState?.validate() != null && formKey.currentState!.validate()) {
                      widget.nextPage();
                      widget.updateFieldsState1(budgetNameController.text.trim());
                    }
                  },
                  padding: const EdgeInsets.all(0),
                  color: ColorsUtils.primary_5,
                ),
                ButtonWidget(
                  title: AppLocalizations.of(context).cancel,
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  padding: const EdgeInsets.all(0),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
