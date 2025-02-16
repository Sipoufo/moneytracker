import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionSaveOneUseCase implements UseCase<TransactionEntity, TransactionSaveOneParam> {
  final TransactionRepository transactionRepository;

  TransactionSaveOneUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, TransactionEntity>> call(TransactionSaveOneParam param) async {
    return await transactionRepository.saveOneTransaction(param.transactionEntity);
  }
}

class TransactionSaveOneParam {
  final TransactionEntity transactionEntity;

  const TransactionSaveOneParam({required this.transactionEntity});
}