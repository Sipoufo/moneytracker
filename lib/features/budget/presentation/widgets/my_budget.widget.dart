import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/utils/formatters/formatter.dart';
import 'package:moneytracker/core/widgets/separator.widget.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/presentation/arguments/budget_create_update.argument.dart';
import 'package:moneytracker/features/budget/presentation/arguments/budget_detail.argument.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.bloc.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.event.dart';

class MyBudgetWidget extends StatelessWidget {
  const MyBudgetWidget({
    super.key,
    required this.budget,
    required this.currencySymbol,
  });

  final BudgetEntity budget;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, "/budget/budget-detail", arguments: BudgetDetailArgument(id: budget.id)).then(
        (_) {
          if (context.mounted) context.read<BudgetBloc>().add(BudgetFetchAllEvent());
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(SizeUtil.md),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(SizeUtil.borderRadiusMd),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
        ),
        child: Column(
          spacing: SizeUtil.spaceBtwItems_16,
          children: [
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: SizeUtil.spaceBtwItems_12,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(SizeUtil.sm),
                  decoration: BoxDecoration(
                    color: Color(budget.category.backgroundColor),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset(
                    budget.category.picture,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),

                Expanded(
                  child: Text(
                    budget.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),

                // Vertical dots icons
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: SizeUtil.lg,
                      color: Theme.of(context).colorScheme.surfaceContainer,
                    ),
                    isExpanded: false,
                    isDense: true,
                    style: Theme.of(context).textTheme.bodySmall,
                    dropdownColor: Theme.of(context).colorScheme.primaryContainer,
                    padding: const EdgeInsets.all(0),
                    onChanged: (value) {},
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        value: "Update",
                        onTap: () {
                          Navigator.pushNamed(context, "/budget/new-budget", arguments: BudgetCreateUpdateArgument(budget: budget));
                        },
                        child: Row(
                          spacing: SizeUtil.spaceBtwItems_12,
                          children: [
                            const Icon(
                              Icons.edit,
                              size: SizeUtil.lg,
                            ),
                            Text(AppLocalizations.of(context).edit),
                          ],
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Delete",
                        onTap: () => context.read<BudgetBloc>().add(BudgetDeleteOneEvent(budget.id)),
                        child: Row(
                          spacing: SizeUtil.spaceBtwItems_12,
                          children: [
                            const Icon(
                              Icons.delete,
                              size: SizeUtil.lg,
                            ),
                            Text(AppLocalizations.of(context).deleteWallet),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Body
            Column(
              spacing: SizeUtil.spaceBtwItems_12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context).budgetPercentageTitle,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: Theme.of(context).colorScheme.tertiaryContainer),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            FormatterUtils.formatCurrencyCompact(budget.currentAmount, symbol: currencySymbol),
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: ColorsUtils.primary_6,
                                ),
                          ),
                          Text(
                            "/${FormatterUtils.formatCurrencyCompact(budget.amount, symbol: currencySymbol)}",
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiaryContainer,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorsUtils.primary_1, borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl)),
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: budget.currentAmount / budget.amount,
                        child: Container(
                          height: SizeUtil.buttonHeight_30,
                          decoration: BoxDecoration(
                              color: ColorsUtils.primary_4,
                              borderRadius: BorderRadius.circular(SizeUtil.borderRadiusXl)),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Text(
                          "${budget.currentAmount == 0 ? budget.currentAmount : budget.amount / budget.currentAmount}%",
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: budget.currentAmount / budget.amount > 0.7
                                  ? Theme.of(context).colorScheme.surface
                                  : ColorsUtils.primary_5),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            const Separator(),

            // Footer
            Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: SizeUtil.spaceBtwItems_4,
                    children: [
                      Text(
                        AppLocalizations.of(context).timeRemaining,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                              fontSize: 8.0,
                            ),
                      ),
                      Text(
                        "${budget.achievementDate.difference(DateTime.now()).inDays} ${AppLocalizations.of(context).day}",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: SizeUtil.spaceBtwItems_4,
                    children: [
                      Text(
                        AppLocalizations.of(context).achievementDate,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                              fontSize: 8.0,
                            ),
                      ),
                      Text(
                        FormatterUtils.formatDate(date: budget.achievementDate),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: SizeUtil.spaceBtwItems_4,
                    children: [
                      Text(
                        AppLocalizations.of(context).categories,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiaryContainer,
                              fontSize: 8.0,
                            ),
                      ),
                      Text(
                        budget.category.name,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
