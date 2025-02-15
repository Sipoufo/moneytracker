import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/budget/data/services/budget.service.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetService budgetService;

  BudgetRepositoryImpl(this.budgetService);

  @override
  Either<Failure, List<BudgetEntity>> fetchAllBudgets() {
    try {
      return right(budgetService.fetchAllBudgets().map((budget) => BudgetEntity.map(budget)).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, BudgetEntity> fetchOneBudget(int id) {
    try {
      return right(BudgetEntity.map(budgetService.fetchOneBudget(id)));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BudgetEntity>> saveOneBudget(BudgetEntity budget) async {
    try {
      return right(BudgetEntity.map(await budgetService.saveOneBudget(BudgetModel.map(budget))));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BudgetEntity>> updateOneBudget(int id, BudgetEntity budget) async {
    try {
      return right(BudgetEntity.map(await budgetService.updateOneBudget(id, BudgetModel.map(budget))));
    } catch (e) {
    return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOneBudget(int id) async {
    try {
      return right(await budgetService.deleteOneBudget(id));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}