import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetFetchAllUseCase implements UseCase<List<BudgetEntity>, NoParams> {
  final BudgetRepository budgetRepository;

  BudgetFetchAllUseCase(this.budgetRepository);

  @override
  Future<Either<Failure, List<BudgetEntity>>> call(NoParams param) async {
    return budgetRepository.fetchAllBudgets();
  }

}