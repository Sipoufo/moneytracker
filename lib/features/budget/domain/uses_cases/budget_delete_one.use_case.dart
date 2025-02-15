import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/budget/domain/entries/budget.entity.dart';
import 'package:moneytracker/features/budget/domain/repositories/budget.repository.dart';

class BudgetDeleteOneUseCase implements UseCase<bool, BudgetDeleteOneParam> {
  final BudgetRepository budgetRepository;

  BudgetDeleteOneUseCase(this.budgetRepository);

  @override
  Future<Either<Failure, bool>> call(BudgetDeleteOneParam param) async {
    return await budgetRepository.deleteOneBudget(param.id);
  }
}

class BudgetDeleteOneParam {
  final int id;

  const BudgetDeleteOneParam({required this.id});
}