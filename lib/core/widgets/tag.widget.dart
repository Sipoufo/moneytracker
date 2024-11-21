import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.name,
    required this.backgroundColor,
    required this.textStyle,
  });

  final String name;
  final Color backgroundColor;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeUtil.sm, vertical: SizeUtil.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
        color: backgroundColor,
      ),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: textStyle,
      ),
    );
  }
}
