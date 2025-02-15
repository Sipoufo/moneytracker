import 'package:flutter/material.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';

@immutable
sealed class BudgetState {}

class BudgetInitialState extends BudgetState{}

class BudgetLoadingState extends BudgetState{}

class BudgetSuccessFetchAllState extends BudgetState {
  final List<BudgetEntity> budgets;

  BudgetSuccessFetchAllState(this.budgets);
}

class BudgetSuccessFetchOneState extends BudgetState {
  final BudgetEntity budget;

  BudgetSuccessFetchOneState(this.budget);
}

class BudgetSuccessSaveOneState extends BudgetState {
  final BudgetEntity budget;

  BudgetSuccessSaveOneState(this.budget);
}

class BudgetSuccessUpdateOneState extends BudgetState {
  final BudgetEntity budget;

  BudgetSuccessUpdateOneState(this.budget);
}

class BudgetSuccessDeleteOneState extends BudgetState {
  final bool isDeleted;

  BudgetSuccessDeleteOneState(this.isDeleted);
}

class BudgetFailureState extends BudgetState {
  final String message;

  BudgetFailureState(this.message);
}