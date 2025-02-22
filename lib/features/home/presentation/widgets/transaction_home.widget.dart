import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/widgets/daily_transaction.widget.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/features/navigation/cubit/application_navigation_cubit.cubit.dart';

class TransactionHome extends StatelessWidget {
  const TransactionHome({
    super.key,
    required this.currency,
  });

  final String currency;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.lg).copyWith(
          bottom: 0.0,
        ),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(SizeUtil.borderRadiusXl)),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: const [
            BoxShadow(
              color: ColorsUtils.shadow,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, -4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context).transaction,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                  onPressed: () => context.read<ApplicationNavigationCubit>().changePage(1),
                  child: Text(
                    AppLocalizations.of(context).seeMore,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ColorsUtils.primary_5,
                        ),
                  ),
                )
              ],
            ),

            // Spacing
            const SizedBox(
              height: SizeUtil.defaultSpace,
            ),

            // Transaction recap
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Today transaction
                    DailyTransactionWidget(
                      title: AppLocalizations.of(context).today,
                      transactions: [],
                      currency: currency,
                    ),

                    // Separator
                    const Separator(),

                    // Yesterday transaction
                    DailyTransactionWidget(
                      title: AppLocalizations.of(context).yesterday,
                      transactions: [],
                      currency: currency,
                    ),

                    // Spacing
                    const SizedBox(
                      height: SizeUtil.defaultSpace,
                    ),
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
