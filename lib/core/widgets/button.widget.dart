import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.textStyle,
    required this.onTap,
    required this.padding,
    required this.color,
    this.border = BorderSide. none,
    this.icon,
  });

  final String title;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Icon? icon;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
            side: border,
          ),
        ),
        child: Wrap(
          spacing: 8.0,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            icon ?? const SizedBox(),
            Text(
              title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
