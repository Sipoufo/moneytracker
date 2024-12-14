import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/helpers/functions.helper.dart';
import 'package:moneytracker/core/widgets/input_form.widget.dart';
import 'package:moneytracker/core/widgets/show_date_picker.widget.dart';

class NewBudgetPage2Widget extends StatelessWidget {
  const NewBudgetPage2Widget({
    super.key,
    required this.budgetAmountController,
    required this.budgetAchievementDateController,
  });

  final TextEditingController budgetAmountController;
  final TextEditingController budgetAchievementDateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFormWidget(
          label: AppLocalizations.of(context).amount,
          placeholder: AppLocalizations.of(context).enterTheAmountsOfFundsNeeded,
          textInputType: TextInputType.number,
          controller: budgetAmountController,
        ),

        // Spacing
        const SizedBox(
          height: SizeUtil.spaceBtwItems_24,
        ),

        InputFormWidget(
          label: AppLocalizations.of(context).achievementDate,
          placeholder: AppLocalizations.of(context).selectDate,
          textInputType: TextInputType.datetime,
          controller: budgetAchievementDateController,
          onTap: () async {
            DateTime? date = DateTime(1900);
            FocusScope.of(context).requestFocus(FocusNode());

            date = await showDatePickerWidget(context);

            if (date != null) {
              budgetAchievementDateController.text = HelperFunctions.getFormattedDate(date);
            }
          },
        ),
      ],
    );
  }
}
