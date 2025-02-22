import 'package:moneytracker/features/home/data/models/home.model.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class HomeEntity {
  final double netBalance;
  final double totalIncomeAmount;
  final double totalExpenseAmount;
  final List<TransactionEntity> transactionOfToday;
  final List<TransactionEntity> transactionOfYesterday;

  HomeEntity({
    required this.netBalance,
    required this.totalIncomeAmount,
    required this.totalExpenseAmount,
    required this.transactionOfToday,
    required this.transactionOfYesterday,
  });

  factory HomeEntity.map(HomeModel home) {
    return HomeEntity(
      netBalance: home.netBalance,
      totalIncomeAmount: home.totalIncomeAmount,
      totalExpenseAmount: home.totalExpenseAmount,
      transactionOfToday: home.transactionOfToday.map((transaction) => TransactionEntity.map(transaction)).toList(),
      transactionOfYesterday: home.transactionOfYesterday.map((transaction) => TransactionEntity.map(transaction)).toList(),
    );
  }
}