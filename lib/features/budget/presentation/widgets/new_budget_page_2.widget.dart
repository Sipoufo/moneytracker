import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/information.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/monthly_screen.widget.dart';

class NewBudgetPage2Widget extends StatefulWidget {
  const NewBudgetPage2Widget({
    super.key,
    required this.amount,
    required this.date,
    required this.save,
    required this.prevPage,
    required this.updateFieldsState2,
  });

  final double amount;
  final DateTime date;
  final void Function() save;
  final void Function() prevPage;
  final void Function(double amountField, DateTime dateTimeField) updateFieldsState2;

  @override
  State<NewBudgetPage2Widget> createState() => _NewBudgetPage2WidgetState();
}

class _NewBudgetPage2WidgetState extends State<NewBudgetPage2Widget> {
  final formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  bool openDateModal = false;
  TextEditingController budgetAmountController = TextEditingController();

  @override
  void initState() {
    budgetAmountController.value = TextEditingValue(text: "${widget.amount}");
    date = widget.date;
    super.initState();
  }

  void changeDate(DateTime actualDate) {
    setState(() {
      date = actualDate;
    });
  }

  void changeOpenDateModal(bool value) {
    setState(() {
      openDateModal = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!openDateModal) {
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
                  child: Column(
                    children: [
                      InputFormWidget(
                        label: AppLocalizations.of(context).amount,
                        placeholder: AppLocalizations.of(context).enterTheAmountsOfFundsNeeded,
                        textInputType: TextInputType.number,
                        controller: budgetAmountController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field can't be empty !";
                          }
                          if (double.tryParse(value) == null) {
                            return "Enter a number !";
                          }
                          return null;
                        },
                      ),

                      // Spacing
                      const SizedBox(
                        height: SizeUtil.spaceBtwItems_24,
                      ),

                      ButtonWidget(
                        title: "${date.day} ${InformationUtil.monthValues(context)[date.month - 1]} ${date.year}",
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        onTap: () {
                          changeOpenDateModal(true);
                        },
                        padding: const EdgeInsets.all(SizeUtil.md),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        secondIcon: IconsUtils.arrowRight(context: context),
                        border: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),
                      ),
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
                    title: AppLocalizations.of(context).finish,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    onTap: () {
                      if (formKey.currentState?.validate() != null && formKey.currentState!.validate()) {
                        widget.updateFieldsState2(double.parse(budgetAmountController.text.trim()), date);
                        widget.save();
                      }
                    },
                    padding: const EdgeInsets.all(0),
                    color: ColorsUtils.primary_5,
                  ),
                  ButtonWidget(
                    title: AppLocalizations.of(context).previous,
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    onTap: () => widget.prevPage(),
                    padding: const EdgeInsets.all(0),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: SingleChildScrollView(
          child: MonthlyScreenWidget(
            date: date,
            changeDate: changeDate,
            changeOpenDateModal: changeOpenDateModal,
          ),
        ),
      );
    }
  }
}
