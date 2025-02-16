import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionFetchOneUseCase implements UseCase<TransactionEntity, TransactionFetchOneParam> {
  final TransactionRepository transactionRepository;

  TransactionFetchOneUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, TransactionEntity>> call(TransactionFetchOneParam param) async {
    return transactionRepository.fetchOneTransaction(param.id);
  }
}

class TransactionFetchOneParam {
  final int id;

  const TransactionFetchOneParam({required this.id});
}