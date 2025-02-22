import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';

abstract interface class TransactionService {
  // Use to fetch all transactions
  List<TransactionModel> fetchAllTransactions();

  // Use to fetch all transactions with start and end date filter
  List<TransactionModel> fetchAllTransactionsByDates(DateTime startDate, DateTime? endDate, TransactionFindTypeEnum transactionFindTypeEnum);

  // Use to fetch one transaction
  TransactionModel fetchOneTransaction(int id);

  // Use to fetch one transaction
  Future<TransactionModel> saveOneTransaction(TransactionModel transaction);

  // Use to fetch one transaction
  Future<TransactionModel> updateOneTransaction(int id, TransactionModel transaction);

  // Use to fetch one transaction
  Future<bool> deleteOneTransaction(int id);
}