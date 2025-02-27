import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';

class ShortcutWidget extends StatelessWidget {
  const ShortcutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: SizeUtil.spaceBtwItems,
        horizontal: SizeUtil.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SizeUtil.sm_12,
        children: [
          Text(
            AppLocalizations.of(context).shortcut,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          ButtonWidget(
            title: AppLocalizations.of(context).addNewTransaction,
            textStyle: Theme.of(context).textTheme.titleMedium,
            onTap: () => Navigator.pushNamed(context, "/transaction/new-transaction"),
            padding:
                const EdgeInsets.symmetric(vertical: SizeUtil.defaultSpace),
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.surface,
            ),
            color: Theme.of(context).colorScheme.primaryContainer,
            border: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer,
              width: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
