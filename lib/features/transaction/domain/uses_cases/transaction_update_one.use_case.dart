import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionUpdateOneUseCase implements UseCase<TransactionEntity, TransactionUpdateOneParam> {
  final TransactionRepository transactionRepository;

  TransactionUpdateOneUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, TransactionEntity>> call(TransactionUpdateOneParam param) async {
    return await transactionRepository.updateOneTransaction(param.id, param.transactionEntity);
  }
}

class TransactionUpdateOneParam {
  final int id;
  final TransactionEntity transactionEntity;

  const TransactionUpdateOneParam({required this.id, required this.transactionEntity});
}