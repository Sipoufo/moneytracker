import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

/// Drop down button widget
/// [selectedValue] is the actual value selected
/// [onChanged] is the function use to manage selected value
/// [values] is the display of list of items
class DropDownButtonWidget<DropDownButtonWidgetValueType>
    extends StatelessWidget {
  const DropDownButtonWidget({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.values,
    required this.placeholder,
  });

  final ValueChanged<DropDownButtonWidgetValueType?>? onChanged;
  final DropDownButtonWidgetValueType? selectedValue;
  final List<DropdownMenuItem<DropDownButtonWidgetValueType>>? values;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primaryContainer,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer),
          borderRadius:
              const BorderRadius.all(Radius.circular(SizeUtil.borderRadiusMd)),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SizeUtil.sm_12,
          vertical: SizeUtil.md_18,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DropDownButtonWidgetValueType>(
          hint: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            child: Text(
              placeholder,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.left,
            ),
          ),
          isExpanded: true,
          isDense: true,
          value: selectedValue,
          style: Theme.of(context).textTheme.bodySmall,
          dropdownColor: Theme.of(context).colorScheme.primaryContainer,
          onChanged: onChanged,
          items: values,
        ),
      ),
    );
  }
}
