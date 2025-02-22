import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/shortcut.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_resume.widget.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({
    super.key,
    required this.currency,
    required this.transaction,
  });

  final TransactionEntity transaction;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of transaction detail page
            HeaderWidget(
              title: AppLocalizations.of(context).transactionDetail,
              firstIcon: IconsUtils.back(context: context, onTap: () => Navigator.pop(context)),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Transaction resume
                    TransactionResumeWidget(transactionEntity: transaction, currencySymbol: currency,),

                    // Shortcut
                    const ShortcutWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
