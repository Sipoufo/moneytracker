import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';
import 'package:moneytracker/core/utils/constants/icons.util.dart';
import 'package:moneytracker/core/utils/constants/size.util.dart';
import 'package:moneytracker/core/widgets/button.widget.dart';
import 'package:moneytracker/core/widgets/header.widget.dart';
import 'package:moneytracker/core/widgets/loading.widget.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/presentation/arguments/budget_create_update.argument.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.bloc.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.event.dart';
import 'package:moneytracker/features/budget/presentation/blocs/budget.state.dart';
import 'package:moneytracker/features/budget/presentation/widgets/budget_banner.widget.dart';
import 'package:moneytracker/features/budget/presentation/widgets/my_budget.widget.dart';
import 'package:moneytracker/features/budget/presentation/widgets/no_budget.widget.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  List<BudgetEntity> budgets = [];

  @override
  void initState() {
    context.read<BudgetBloc>().add(BudgetFetchAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: BlocConsumer<BudgetBloc, BudgetState>(
          listener: (context, state) {
            if (state is BudgetSuccessFetchAllState) {
              setState(() {
                budgets = state.budgets;
              });
            }
            if (state is BudgetSuccessDeleteOneState) {
              context.read<BudgetBloc>().add(BudgetFetchAllEvent());
            }
          },
          builder: (context, state) {
            if (state is BudgetLoadingState) {
              return const Expanded(child: Center(child: LoadingWidget()));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header of transaction recap page
                HeaderWidget(
                  title: AppLocalizations.of(context).budgeting,
                  secondIcon: IconsUtils.addNote(context: context, onTap: () {}),
                  thirdIcon: IconsUtils.search(context: context, onTap: () {}),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Banner
                        const BudgetBanner(),

                        // Create a budget
                        ButtonWidget(
                          title: AppLocalizations.of(context).createNewBudget,
                          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsUtils.primary_4,
                          ),
                          onTap: () => Navigator.pushNamed(context, "/budget/new-budget", arguments: BudgetCreateUpdateArgument()),
                          padding: const EdgeInsets.all(SizeUtil.md_18),
                          margin: const EdgeInsets.symmetric(horizontal: SizeUtil.md_18, vertical: SizeUtil.lg),
                          color: Theme.of(context).colorScheme.primaryContainer,
                          icon: const Icon(
                            Icons.add,
                            color: ColorsUtils.primary_4,
                            size: SizeUtil.iconMd,
                          ),
                          border: const BorderSide(color: ColorsUtils.primary_4, style: BorderStyle.solid),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: SizeUtil.md, vertical: SizeUtil.sm_12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: SizeUtil.spaceBtwItems_24,
                            children: [
                              Text(
                                AppLocalizations.of(context).yourBudget,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),

                              // Your budget
                              if (budgets.isEmpty)
                                const NoBudgetWidget(),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: SizeUtil.spaceBtwItems_12,
                                children: budgets.map((budget) {
                                  return MyBudgetWidget(budget: budget);
                                }).toList(),
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
