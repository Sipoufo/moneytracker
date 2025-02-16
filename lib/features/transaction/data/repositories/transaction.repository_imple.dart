import 'package:fpdart/src/either.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';
import 'package:moneytracker/features/transaction/data/services/transaction.service.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';
import 'package:moneytracker/features/transaction/domain/repositoies/transaction.repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionService transactionService;

  TransactionRepositoryImpl(this.transactionService);

  @override
  Either<Failure, List<TransactionEntity>> fetchAllTransactions() {
    try {
      return right(transactionService.fetchAllTransactions().map((transaction) => TransactionEntity.map(transaction)).toList());
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Either<Failure, TransactionEntity> fetchOneTransaction(int id) {
    try {
      return right(TransactionEntity.map(transactionService.fetchOneTransaction(id)));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> saveOneTransaction(TransactionEntity transaction) async {
    try {
      return right(TransactionEntity.map(await transactionService.saveOneTransaction(TransactionModel.map(transaction))));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> updateOneTransaction(int id, TransactionEntity transaction) async {
    try {
      return right(TransactionEntity.map(await transactionService.updateOneTransaction(id, TransactionModel.map(transaction))));
    } catch (e) {
    return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteOneTransaction(int id) async {
    try {
      return right(await transactionService.deleteOneTransaction(id));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}