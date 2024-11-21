import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';

class HeaderTransactionDetailWidget extends StatelessWidget {
  const HeaderTransactionDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SizeUtil.sm_12,
        horizontal: SizeUtil.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Back button
          IconsUtils.back(
              context: context, onTap: () => Navigator.pop(context)),

          const SizedBox(
            width: SizeUtil.spaceBtwItems,
          ),

          // Title
          Text(
            AppLocalizations.of(context).transactionDetail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
