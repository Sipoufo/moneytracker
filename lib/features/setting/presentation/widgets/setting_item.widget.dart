import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.title,
    required this.label,
    required this.onTap,
    this.icon,
    this.secondIcon,
  });

  final String title;
  final String label;
  final Icon? icon;
  final Widget? secondIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
        ),

        // Account
        ButtonWidget(
          title: label,
          textStyle: Theme.of(context).textTheme.titleMedium,
          onTap: onTap,
          padding: const EdgeInsets.symmetric(horizontal: SizeUtil.sm_12, vertical: SizeUtil.md),
          margin: const EdgeInsets.only(top: SizeUtil.sm_12),
          icon: icon,
          secondIcon: secondIcon,
          color: Theme.of(context).colorScheme.primaryContainer,
          border: BorderSide(
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: 2.0,
          ),
        ),
      ],
    );
  }
}
