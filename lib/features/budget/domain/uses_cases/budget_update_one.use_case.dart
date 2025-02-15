import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetUpdateOneUseCase implements UseCase<BudgetEntity, BudgetUpdateOneParam> {
  final BudgetRepository budgetRepository;

  BudgetUpdateOneUseCase(this.budgetRepository);

  @override
  Future<Either<Failure, BudgetEntity>> call(BudgetUpdateOneParam param) async {
    return await budgetRepository.updateOneBudget(param.id, param.budgetEntity);
  }
}

class BudgetUpdateOneParam {
  final int id;
  final BudgetEntity budgetEntity;

  const BudgetUpdateOneParam({required this.id, required this.budgetEntity});
}