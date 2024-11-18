import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: SizeUtil.defaultSpace,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          AppLocalizations.of(context).skip,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
