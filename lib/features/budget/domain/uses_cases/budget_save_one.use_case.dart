import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetSaveOneUseCase implements UseCase<BudgetEntity, BudgetSaveOneParam> {
  final BudgetRepository budgetRepository;

  BudgetSaveOneUseCase(this.budgetRepository);

  @override
  Future<Either<Failure, BudgetEntity>> call(BudgetSaveOneParam param) async {
    return await budgetRepository.saveOneBudget(param.budgetEntity);
  }
}

class BudgetSaveOneParam {
  final BudgetEntity budgetEntity;

  const BudgetSaveOneParam({required this.budgetEntity});
}