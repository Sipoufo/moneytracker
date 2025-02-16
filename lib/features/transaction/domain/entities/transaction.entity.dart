import 'package:hive_flutter/adapters.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';
import 'package:moneytracker/features/setting/domain/entities/wallet/setting_wallet.entity.dart';
import 'package:moneytracker/features/transaction/data/models/transaction.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category.model.dart';

class TransactionEntity {
  int id;
  final String name;
  final SettingWalletEntity wallet;
  final TransactionCategoryModel category;
  final double amount;
  final String amountIcon;
  final DateTime dateTime;
  final String note;

  TransactionEntity({
    this.id = 0,
    required this.name,
    required this.wallet,
    required this.category,
    required this.amount,
    required this.amountIcon,
    required this.dateTime,
    required this.note,
  });

  factory TransactionEntity.map(TransactionModel transaction) {
    return TransactionEntity(
      id: transaction.id,
      name: transaction.name,
      wallet: SettingWalletEntity.map(transaction.wallet),
      category: transaction.category,
      amount: transaction.amount,
      amountIcon: transaction.amountIcon,
      dateTime: transaction.dateTime,
      note: transaction.note,
    );
  }
}
