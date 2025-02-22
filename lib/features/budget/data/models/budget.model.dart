import 'package:hive/hive.dart';
import 'package:moneytracker/core/utils/enums/category_emoji.enum.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';

part 'budget.model.g.dart';

/// Model for category of financial depends
/// [name] represent the name of budget
/// [amount] represent the amount of budget
/// [achievementDate] represent the achievement date
@HiveType(typeId: 09)
class BudgetModel {
  @HiveField(00)
  int id;
  @HiveField(01)
  final String name;
  @HiveField(02)
  final double amount;
  @HiveField(03)
  final DateTime achievementDate;
  @HiveField(04)
  double currentAmount;
  @HiveField(05)
  final CategoryEnum category;
  @HiveField(06)
  List<TransactionModel> transactions = [];

  BudgetModel({
    this.id = 0,
    required this.name,
    required this.amount,
    required this.currentAmount,
    required this.achievementDate,
    required this.category,
  });

  factory BudgetModel.map(BudgetEntity budget) {
    BudgetModel budgetModel = BudgetModel(
      id: budget.id,
      name: budget.name,
      amount: budget.amount,
      currentAmount: budget.currentAmount,
      achievementDate: budget.achievementDate,
      category: budget.category,
    );
    budgetModel.transactions = budget.transactions;
    return budgetModel;
  }
}
