import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionDeleteOneUseCase implements UseCase<bool, TransactionDeleteOneParam> {
  final TransactionRepository transactionRepository;

  TransactionDeleteOneUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, bool>> call(TransactionDeleteOneParam param) async {
    return await transactionRepository.deleteOneTransaction(param.id);
  }
}

class TransactionDeleteOneParam {
  final int id;

  const TransactionDeleteOneParam({required this.id});
}