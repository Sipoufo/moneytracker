import 'package:flutter/material.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/header_transaction_detail.widget.dart';
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
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header of transaction detail page
            HeaderTransactionDetailWidget(),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Transaction resume
                    TransactionResumeWidget(),

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
