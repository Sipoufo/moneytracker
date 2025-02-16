import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/shortcut.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_resume.widget.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({super.key});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {


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
              firstIcon: IconsUtils.back(
                  context: context, onTap: () => Navigator.pop(context)),
            ),

            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Transaction resume
                    // TransactionResumeWidget(),

                    // Shortcut
                    ShortcutWidget(),
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
