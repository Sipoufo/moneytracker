import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/daily_transaction.widget.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({
    super.key,
    required this.currency,
    required this.transactions,
  });

  final List<TransactionEntity> transactions;
  final String currency;

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
              transactions: transactions,
              currency: currency,
            ),
          ),
        ],
      ),
    );
  }
}