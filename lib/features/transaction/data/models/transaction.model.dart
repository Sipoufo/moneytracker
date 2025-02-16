import 'package:hive_flutter/adapters.dart';
import 'package:moneytracker/features/setting/data/models/wallet/setting_wallet.model.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category.model.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

part 'transaction.model.g.dart';

@HiveType(typeId: 11)
class TransactionModel {
  @HiveField(00)
  int id;

  @HiveField(01)
  final String name;

  @HiveField(02)
  final SettingWalletModel wallet;

  @HiveField(03)
  final TransactionCategoryModel category;

  @HiveField(04)
  final double amount;

  @HiveField(05)
  final String amountIcon;

  @HiveField(06)
  final DateTime dateTime;

  @HiveField(07)
  final String note;

  TransactionModel({
    this.id = 0,
    required this.name,
    required this.wallet,
    required this.category,
    required this.amount,
    required this.amountIcon,
    required this.dateTime,
    required this.note,
  });

  factory TransactionModel.map(TransactionEntity transaction) {
    return TransactionModel(
      id: transaction.id,
      name: transaction.name,
      wallet: SettingWalletModel.map(transaction.wallet),
      category: transaction.category,
      amount: transaction.amount,
      amountIcon: transaction.amountIcon,
      dateTime: transaction.dateTime,
      note: transaction.note,
    );
  }
}
