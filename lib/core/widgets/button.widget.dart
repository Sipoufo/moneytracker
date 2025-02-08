import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.textStyle,
    required this.onTap,
    required this.padding,
    required this.color,
    this.border = BorderSide.none,
    this.margin = const EdgeInsets.all(0),
    this.icon,
    this.secondIcon,
  });

  final String title;
  final TextStyle? textStyle;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;
  final Widget? icon;
  final Widget? secondIcon;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
            side: border,
          ),

        ),
        child: Row(
          mainAxisAlignment: secondIcon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Wrap(
                spacing: SizeUtil.sm,
                alignment: secondIcon == null ? WrapAlignment.center : WrapAlignment.start,
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
            secondIcon == null
                ? const SizedBox()
                : const SizedBox(
                    width: SizeUtil.spaceBtwItems,
                  ),
            secondIcon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
