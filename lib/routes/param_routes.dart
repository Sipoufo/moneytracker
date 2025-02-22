import 'package:flutter/material.dart';
import 'package:moneytracker/features/budget/domain/uses_cases/budget_update_one.use_case.dart';
import 'package:moneytracker/features/budget/presentation/arguments/budget_create_update.argument.dart';
import 'package:moneytracker/features/budget/presentation/arguments/budget_detail.argument.dart';
import 'package:moneytracker/features/budget/presentation/pages/budget_detail.dart';
import 'package:moneytracker/features/budget/presentation/pages/new_budget_budget_name.dart';
import 'package:moneytracker/features/transaction/presentation/arguments/transaction_detail.argument.dart';
import 'package:moneytracker/features/transaction/presentation/pages/transaction_detail.dart';

Route<dynamic>? paramRoutes(RouteSettings setting) {
  switch (setting.name) {
    // Budget part
    case "/budget/budget-detail":
      final args = setting.arguments as BudgetDetailArgument;
      return MaterialPageRoute(
        builder: (context) => BudgetDetail(id: args.id),
      );
    case "/budget/new-budget":
      final args = setting.arguments as BudgetCreateUpdateArgument;
      return MaterialPageRoute(
        builder: (context) => NewBudget(budget: args.budget),
      );
    case "/transaction/transaction-detail":
      final args = setting.arguments as TransactionDetailArgument;
      return MaterialPageRoute(
        builder: (context) => TransactionDetail(transaction: args.transaction, currency: args.currency),
      );
    default:
      return null;
  }
}
