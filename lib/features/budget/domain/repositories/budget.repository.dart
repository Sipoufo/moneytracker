import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';

abstract interface class BudgetRepository {
  // Use to fetch all budgets
  Either<Failure, List<BudgetEntity>> fetchAllBudgets();

  // Use to fetch one budget
  Either<Failure, BudgetEntity> fetchOneBudget(int id);

  // Use to fetch one budget
  Future<Either<Failure, BudgetEntity>> saveOneBudget(BudgetEntity budget);

  // Use to fetch one budget
  Future<Either<Failure, BudgetEntity>> updateOneBudget(int id, BudgetEntity budget);

  // Use to fetch one budget
  Future<Either<Failure, bool>> deleteOneBudget(int id);
}