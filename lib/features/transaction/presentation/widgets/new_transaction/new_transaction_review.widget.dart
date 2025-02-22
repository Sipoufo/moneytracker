import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/core/widgets/show_snackbar.widget.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.bloc.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.event.dart';
import 'package:moneytracker/features/transaction/presentation/blocs/transaction.state.dart';
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
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccessSaveOneState) {
          showSnackBar(context, "Successful added !", isError: false);
          context.read<ApplicationNavigationCubit>().changePage(0);
          context
              .read<TransactionBloc>()
              .add(TransactionFetchAllByDatesEvent(startDate: DateTime.now(), transactionFindTypeEnum: TransactionFindTypeEnum.values[2]));
          Navigator.pop(context);
        }
        if (state is TransactionFailureState) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is TransactionLoadingState) {
          return const Center(child: LoadingWidget());
        }
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
      },
    );
  }
}
