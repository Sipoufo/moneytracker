import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class NewTransactionDateTimeTimeItemWidget extends StatelessWidget {
  const NewTransactionDateTimeTimeItemWidget({
    super.key,
    required this.values,
    required this.initIndex,
    required this.changeValue,
  });

  final List<String> values;
  final int initIndex;
  final Function(String value) changeValue;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: 20,
      perspective: 0.01,
      diameterRatio: 1,
      physics: const FixedExtentScrollPhysics(),
      controller: FixedExtentScrollController(initialItem: initIndex),
      onSelectedItemChanged: (index) {
        changeValue(values[index]);
      },
      children: values.map((item) {
        return Text(
          item,
          style: Theme.of(context).textTheme.titleSmall,
        );
      }).toList(),
    );
  }
}
