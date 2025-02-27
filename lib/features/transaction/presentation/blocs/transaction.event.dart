import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/enums/enums.dart';
import 'package:moneytracker/features/transaction/domain/entities/transaction.entity.dart';

@immutable
sealed class TransactionEvent {}

class TransactionFetchAllEvent extends TransactionEvent {}

class TransactionFetchAllOfTodayAndYesterdayEvent extends TransactionEvent {}

class TransactionFetchAllByDatesEvent extends TransactionEvent {
  final DateTime startDate;
  final DateTime? endDate;
  final TransactionFindTypeEnum transactionFindTypeEnum;

  TransactionFetchAllByDatesEvent({
    required this.startDate,
    this.endDate,
    required this.transactionFindTypeEnum,
  });
}

class TransactionFetchOneEvent extends TransactionEvent {
  final int id;

  TransactionFetchOneEvent(this.id);
}

class TransactionSaveOneEvent extends TransactionEvent {
  final TransactionEntity transaction;

  TransactionSaveOneEvent(this.transaction);
}

class TransactionUpdateOneEvent extends TransactionEvent {
  final int id;
  final TransactionEntity transaction;

  TransactionUpdateOneEvent(this.id, this.transaction);
}

class TransactionDeleteOneEvent extends TransactionEvent {
  final int id;

  TransactionDeleteOneEvent(this.id);
}
