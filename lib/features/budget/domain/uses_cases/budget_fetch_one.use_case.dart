import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetFetchOneUseCase implements UseCase<BudgetEntity, BudgetFetchOneParam> {
  final BudgetRepository budgetRepository;

  BudgetFetchOneUseCase(this.budgetRepository);

  @override
  Future<Either<Failure, BudgetEntity>> call(BudgetFetchOneParam param) async {
    return budgetRepository.fetchOneBudget(param.id);
  }
}

class BudgetFetchOneParam {
  final int id;

  const BudgetFetchOneParam({required this.id});
}