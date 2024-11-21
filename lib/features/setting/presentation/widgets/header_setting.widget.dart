import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class HeaderSettingWidget extends StatelessWidget {
  const HeaderSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SizeUtil.sm_12,
        horizontal: SizeUtil.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Text(
            AppLocalizations.of(context).transactionDetail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          // Spacing
          const SizedBox(
            width: SizeUtil.spaceBtwItems,
          ),

          // Representation
          Container(
            padding: const EdgeInsets.all(SizeUtil.md),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsUtils.primary_5,
            ),
            child: Text(
              "S",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),

        ],
      ),
    );
  }
}
