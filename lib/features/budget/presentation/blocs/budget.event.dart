import 'package:flutter/material.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';

@immutable
sealed class BudgetEvent {}

class BudgetFetchAllEvent extends BudgetEvent {}

class BudgetFetchOneEvent extends BudgetEvent {
  final int id;

  BudgetFetchOneEvent(this.id);
}

class BudgetSaveOneEvent extends BudgetEvent {
  final BudgetEntity budget;

  BudgetSaveOneEvent(this.budget);
}

class BudgetUpdateOneEvent extends BudgetEvent {
  final int id;
  final BudgetEntity budget;

  BudgetUpdateOneEvent(this.id, this.budget);
}

class BudgetDeleteOneEvent extends BudgetEvent {
  final int id;

  BudgetDeleteOneEvent(this.id);
}