import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizeUtil.defaultSpace),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
      ),
    );
  }
}
