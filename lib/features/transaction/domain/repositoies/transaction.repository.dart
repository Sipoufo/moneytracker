import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/errors/failure.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

abstract interface class TransactionRepository {
  // Use to fetch all transaction
  Either<Failure, List<TransactionEntity>> fetchAllTransactions();

  // Use to fetch one transaction
  Either<Failure, TransactionEntity> fetchOneTransaction(int id);

  // Use to fetch one transaction
  Future<Either<Failure, TransactionEntity>> saveOneTransaction(TransactionEntity transaction);

  // Use to fetch one transaction
  Future<Either<Failure, TransactionEntity>> updateOneTransaction(int id, TransactionEntity transaction);

  // Use to fetch one Transaction
  Future<Either<Failure, bool>> deleteOneTransaction(int id);
}