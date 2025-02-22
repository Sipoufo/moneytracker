import 'package:moneytracker/features/home/domain/entities/home.entity.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';

class HomeModel {
  final double netBalance;
  final double totalIncomeAmount;
  final double totalExpenseAmount;
  final List<TransactionModel> transactionOfToday;
  final List<TransactionModel> transactionOfYesterday;

  HomeModel({
    required this.netBalance,
    required this.totalIncomeAmount,
    required this.totalExpenseAmount,
    required this.transactionOfToday,
    required this.transactionOfYesterday,
  });

  factory HomeModel.map(HomeEntity home) {
    return HomeModel(
      netBalance: home.netBalance,
      totalIncomeAmount: home.totalIncomeAmount,
      totalExpenseAmount: home.totalExpenseAmount,
      transactionOfToday: home.transactionOfToday.map((transaction) => TransactionModel.map(transaction)).toList(),
      transactionOfYesterday: home.transactionOfYesterday.map((transaction) => TransactionModel.map(transaction)).toList(),
    );
  }
}
