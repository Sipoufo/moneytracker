import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/shortcut.widget.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_resume.widget.dart';

class NewTransactionReviewsWidget extends StatefulWidget {
  const NewTransactionReviewsWidget({
    super.key,
    required this.updateTransactionStepIndex,
  });

  final Function(int step) updateTransactionStepIndex;

  @override
  State<NewTransactionReviewsWidget> createState() => _NewTransactionReviewsWidgetState();
}

class _NewTransactionReviewsWidgetState extends State<NewTransactionReviewsWidget> {
  final TextEditingController transactionNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeUtil.sm_12,
        vertical: SizeUtil.md,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: SizeUtil.defaultSpace,
                children: [
                  // Transaction resume
                  TransactionResumeWidget(),
                ],
              ),
            ),
          ),

          // Button button
          Column(
            children: [
              ButtonWidget(
                title: AppLocalizations.of(context).finish,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(SizeUtil.md),
                color: ColorsUtils.primary_5,
              ),
              ButtonWidget(
                title: AppLocalizations.of(context).previous,
                textStyle: Theme.of(context).textTheme.headlineSmall,
                onTap: () {
                  widget.updateTransactionStepIndex(3);
                },
                padding: const EdgeInsets.all(SizeUtil.md),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
