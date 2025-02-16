import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.bloc.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.event.dart';
import 'package:moneytracker/features/transaction/presentation/widgets/transaction_resume.widget.dart';

class NewTransactionReviewsWidget extends StatefulWidget {
  const NewTransactionReviewsWidget({
    super.key,
    required this.currencySymbol,
    required this.transactionEntity,
    required this.updateTransactionStepIndex,
  });

  final String currencySymbol;
  final Function(int step) updateTransactionStepIndex;
  final TransactionEntity transactionEntity;

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: SizeUtil.defaultSpace,
                children: [
                  // Transaction resume
                  TransactionResumeWidget(currencySymbol: widget.currencySymbol, transactionEntity: widget.transactionEntity,),
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
                  context.read<ApplicationNavigationCubit>().changePage(0);
                  Navigator.pop(context);
                  context.read<TransactionBloc>().add(TransactionSaveOneEvent(widget.transactionEntity));
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
