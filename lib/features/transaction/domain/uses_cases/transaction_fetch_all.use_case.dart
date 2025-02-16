import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/core/uses_cases/use_case.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionFetchAllUseCase implements UseCase<List<TransactionEntity>, NoParams> {
  final TransactionRepository transactionRepository;

  TransactionFetchAllUseCase(this.transactionRepository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(NoParams param) async {
    return transactionRepository.fetchAllTransactions();
  }

}