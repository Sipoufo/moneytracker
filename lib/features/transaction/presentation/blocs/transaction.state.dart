import 'package:flutter/material.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

@immutable
sealed class TransactionState {}

class TransactionInitialState extends TransactionState{}

class TransactionLoadingState extends TransactionState{}

class TransactionSuccessFetchAllState extends TransactionState {
  final List<TransactionEntity> transactions;

  TransactionSuccessFetchAllState(this.transactions);
}

class TransactionSuccessFetchOneState extends TransactionState {
  final TransactionEntity transactions;

  TransactionSuccessFetchOneState(this.transactions);
}

class TransactionSuccessSaveOneState extends TransactionState {
  final TransactionEntity transactions;

  TransactionSuccessSaveOneState(this.transactions);
}

class TransactionSuccessUpdateOneState extends TransactionState {
  final TransactionEntity Transaction;

  TransactionSuccessUpdateOneState(this.Transaction);
}

class TransactionSuccessDeleteOneState extends TransactionState {
  final bool isDeleted;

  TransactionSuccessDeleteOneState(this.isDeleted);
}

class TransactionFailureState extends TransactionState {
  final String message;

  TransactionFailureState(this.message);
}