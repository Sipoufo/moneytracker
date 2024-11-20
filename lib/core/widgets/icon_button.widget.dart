import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
    required this.color,
    required this.icon,
    this.buttonStyle,
  });

  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: buttonStyle,
      icon: Icon(
        icon,
        size: SizeUtil.iconMd,
        color: color,
      ),
    );
  }
}
