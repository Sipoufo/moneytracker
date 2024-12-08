import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/daily_transaction.widget.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: SizeUtil.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).transactionList,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),

          // Yesterday transaction
          Padding(
            padding: const EdgeInsets.only(
              top: SizeUtil.md,
            ),
            child: DailyTransactionWidget(
              dateTime: DateTime.now().copyWith(
                day: DateTime.now().day - 2,
              ),
            ),
          ),

          // Today transaction
          Padding(
            padding: const EdgeInsets.only(
              top: SizeUtil.md,
            ),
            child: DailyTransactionWidget(
              dateTime: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}