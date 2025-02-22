import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

class TransactionDetailArgument {
  final String currency;
  final TransactionEntity transaction;

  const TransactionDetailArgument({required this.currency, required this.transaction});
}