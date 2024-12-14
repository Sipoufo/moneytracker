import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/init_values.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future showDatePickerWidget(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(InitValuesUtil.startDate),
    lastDate: DateTime(InitValuesUtil.endDate),
    helpText: AppLocalizations.of(context).achievementDate,
    fieldLabelText: AppLocalizations.of(context).achievementDate,
    cancelText: AppLocalizations.of(context).cancel,
    confirmText: "Ok",
    builder: (context, child) {
      return Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: ColorsUtils.primary_5,
          ),
          datePickerTheme: DatePickerThemeData(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            dividerColor: Theme.of(context).colorScheme.primaryContainer,
            headerBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
            headerForegroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: child!,
      );
    },
  );
}