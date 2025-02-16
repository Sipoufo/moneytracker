import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';
import 'package:moneytracker/features/transaction/data/services/transaction.service.dart';

class TransactionServiceImpl implements TransactionService {
  final LocalDataService<TransactionModel> localDataService;

  TransactionServiceImpl(this.localDataService);

  @override
  List<TransactionModel> fetchAllTransactions() {
    List<TransactionModel> transactions = localDataService.loadData();
    return transactions;
  }

  @override
  List<TransactionModel> fetchAllTransactionsByDates(DateTime startDate, DateTime? endDate, String type) {
    // TODO: implement fetchAllTransactionsByDates
    throw UnimplementedError();
  }

  @override
  TransactionModel fetchOneTransaction(int id) {
    TransactionModel? transactionFetch = localDataService.loadOneData(id: id);

    if (transactionFetch == null) {
      throw "This transaction don't exist";
    }

    return transactionFetch;
  }

  @override
  Future<TransactionModel> saveOneTransaction(TransactionModel transaction) async {
    try {
      int transactionSaveId = await localDataService.addLocalData(data: transaction);
      transaction.id = transactionSaveId;
      await localDataService.updateLocalData(id: transaction.id, data: transaction);
      return transaction;
    } catch (e) {
      throw "Error please retry !";
    }
  }

  @override
  Future<TransactionModel> updateOneTransaction(int id, TransactionModel transaction) async {
    fetchOneTransaction(id);

    await localDataService.updateLocalData(id: transaction.id, data: transaction);
    return transaction;
  }

  @override
  Future<bool> deleteOneTransaction(int id) async {
    fetchOneTransaction(id);
    await localDataService.deleteOneLocalData(id: id);
    return true;
  }
}