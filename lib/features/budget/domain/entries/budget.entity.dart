import 'package:moneytracker/core/utils/enums/category_emoji.enum.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';

class BudgetEntity {
  int id;
  final String name;
  final double amount;
  final double currentAmount;
  final DateTime achievementDate;
  final CategoryEnum category;
  List<TransactionModel> transactions = [];

  BudgetEntity({
    this.id = 0,
    required this.name,
    required this.amount,
    required this.currentAmount,
    required this.achievementDate,
    required this.category,
  });

  factory BudgetEntity.map(BudgetModel budget) {
    BudgetEntity budgetEntity = BudgetEntity(
      id: budget.id,
      name: budget.name,
      amount: budget.amount,
      currentAmount: budget.currentAmount,
      achievementDate: budget.achievementDate,
      category: budget.category,
    );
    budgetEntity.transactions = budget.transactions;
    return budgetEntity;
  }
}
