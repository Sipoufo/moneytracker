import 'package:collection/collection.dart';
import 'package:fpdart/fpdart.dart';
import 'package:moneytracker/core/services/local_data/local_data.service.dart';
import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/features/budget/data/models/budget.model.dart';
import 'package:moneytracker/features/home/data/models/home.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category_type.enum.dart';
import 'package:moneytracker/features/transaction/data/services/transaction.service.dart';

class TransactionServiceImpl implements TransactionService {
  final LocalDataService<TransactionModel> localDataService;
  final LocalDataService<BudgetModel> localDataServiceBudgetModel;

  TransactionServiceImpl(this.localDataService, this.localDataServiceBudgetModel);

  @override
  List<TransactionModel> fetchAllTransactions() {
    List<TransactionModel> transactions = localDataService.loadData();
    return transactions;
  }

  @override
  HomeModel fetchAllTransactionsOfTodayAndYesterday() {
    List<TransactionModel> transactionOfToday = [];
    List<TransactionModel> transactionOfYesterday = [];
    double netBalance = 0;
    double totalIncomeAmount = 0;
    double totalExpenseAmount = 0;
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));

    for (TransactionModel transaction in localDataService.loadData()) {
      netBalance += transaction.amount;
      if (transaction.category.type == TransactionCategoryTypeEnum.income) {
        totalIncomeAmount += transaction.amount;
      }
      if (transaction.category.type == TransactionCategoryTypeEnum.expenses) {
        totalExpenseAmount += transaction.amount;
      }

      if (transaction.dateTime.eqvYearMonthDay(today)) {
        transactionOfToday.add(transaction);
      }
      if (transaction.dateTime.eqvYearMonthDay(yesterday)) {
        transactionOfYesterday.add(transaction);
      }
    }

    return HomeModel(
      netBalance: netBalance,
      totalIncomeAmount: totalIncomeAmount,
      totalExpenseAmount: totalExpenseAmount,
      transactionOfToday: transactionOfToday,
      transactionOfYesterday: transactionOfYesterday,
    );
  }

  @override
  List<TransactionModel> fetchAllTransactionsByDates(
      DateTime startDate, DateTime? endDate, TransactionFindTypeEnum transactionFindTypeEnum) {
    List<TransactionModel> transactions = localDataService.loadData();
    List<TransactionModel> transactionsFinalResult = [];

    // If type is annually
    if (transactionFindTypeEnum == TransactionFindTypeEnum.annually) {
      if (endDate == null) {
        for (TransactionModel transaction in transactions) {
          if (transaction.dateTime.eqvYear(startDate)) {
            transactionsFinalResult.add(transaction);
          }
        }
      } else {
        for (TransactionModel transaction in transactions) {
          if (startDate.year < transaction.dateTime.year && transaction.dateTime.year < endDate.year) {
            transactionsFinalResult.add(transaction);
          }
        }
      }
    }

    // If type is monthly
    if (transactionFindTypeEnum == TransactionFindTypeEnum.monthly) {
      if (endDate == null) {
        for (TransactionModel transaction in transactions) {
          if (transaction.dateTime.eqvYear(startDate) && transaction.dateTime.eqvMonth(startDate)) {
            transactionsFinalResult.add(transaction);
          }
        }
      } else {
        for (TransactionModel transaction in transactions) {
          if (startDate.year < transaction.dateTime.year && transaction.dateTime.year < endDate.year) {
            if (startDate.month < transaction.dateTime.month && transaction.dateTime.month < endDate.month) {
              transactionsFinalResult.add(transaction);
            }
          }
        }
      }
    }

    // If type is daily
    if (transactionFindTypeEnum == TransactionFindTypeEnum.daily) {
      if (endDate == null) {
        for (TransactionModel transaction in transactions) {
          if (transaction.dateTime.eqvYearMonthDay(startDate)) {
            transactionsFinalResult.add(transaction);
          }
        }
      } else {
        for (TransactionModel transaction in transactions) {
          if (transaction.dateTime.isBefore(endDate) && transaction.dateTime.isAfter(startDate)) {
            transactionsFinalResult.add(transaction);
          }
        }
      }
    }

    return transactionsFinalResult;
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
      List<BudgetModel> budgets = localDataServiceBudgetModel.loadData();

      // If transaction category type is expense
      if (transaction.category.type == TransactionCategoryTypeEnum.expenses) {
        // Check if transaction can be subscribe to one wallet
        BudgetModel? budget = budgets.firstWhereOrNull(
          (budget) =>
              budget.achievementDate.isAfter(transaction.dateTime) && budget.category == transaction.category.category,
        );
        if (budget != null && budget.amount > budget.currentAmount) {
          budget.currentAmount += transaction.amount;
          List<TransactionModel> budgetTransactions = budget.transactions;
          budgetTransactions.add(transaction);
          budget.transactions = budgetTransactions;
          await localDataServiceBudgetModel.updateLocalData(id: budget.id, data: budget);
        }
      }

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
