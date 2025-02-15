import 'package:moneytracker/features/budget/data/models/budget.model.dart';

abstract interface class BudgetService {
  // Use to fetch all budgets
  List<BudgetModel> fetchAllBudgets();

  // Use to fetch one budget
  BudgetModel fetchOneBudget(int id);

  // Use to fetch one budget
  Future<BudgetModel> saveOneBudget(BudgetModel budget);

  // Use to fetch one budget
  Future<BudgetModel> updateOneBudget(int id, BudgetModel budget);

  // Use to fetch one budget
  Future<bool> deleteOneBudget(int id);
}