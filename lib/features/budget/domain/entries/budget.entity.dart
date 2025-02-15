import 'package:moneytracker/core/utils/models/category.model.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';

class BudgetEntity {
  int id;
  final String name;
  final double amount;
  final double currentAmount;
  final DateTime achievementDate;
  final CategoryModel category;

  BudgetEntity({
    this.id = 0,
    required this.name,
    required this.amount,
    required this.currentAmount,
    required this.achievementDate,
    required this.category,
  });

  factory BudgetEntity.map(BudgetModel budget) {
    return BudgetEntity(
      id: budget.id,
      name: budget.name,
      amount: budget.amount,
      currentAmount: budget.currentAmount,
      achievementDate: budget.achievementDate,
      category: budget.category,
    );
  }
}
