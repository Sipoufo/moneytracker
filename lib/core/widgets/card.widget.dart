import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.backgroundColor,
    required this.padding,
    required this.borderRadius,
    required this.title,
    required this.titleStyle,
    required this.content,
    required this.contextStyle,
    this.width,
    this.spacing,
    this.isHorizontalCenter = true,
    this.icon,
  });

  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;
  final String title;
  final TextStyle? titleStyle;
  final String content;
  final TextStyle? contextStyle;
  final double? width;
  final double? spacing;
  final bool isHorizontalCenter;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: isHorizontalCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          SizedBox(
            height: spacing ?? SizeUtil.spaceBtwItems_2,
          ),
          Row(
            children: [
              SizedBox(child: icon),
              SizedBox(
                width: icon != null ? SizeUtil.xs : 0,
              ),
              Expanded(
                child: Text(
                  content,
                  textAlign: TextAlign.left,
                  style: contextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
