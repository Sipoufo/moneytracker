import 'package:hive_flutter/adapters.dart';
import 'package:moneytracker/core/utils/enums/category_emoji.enum.dart';
import 'package:moneytracker/features/transaction/data/models/transaction_category_type.enum.dart';

part 'transaction_category.model.g.dart';

@HiveType(typeId: 10)
class TransactionCategoryModel {
  @HiveField(00)
  final CategoryEnum category;

  @HiveField(01)
  final TransactionCategoryTypeEnum type;

  TransactionCategoryModel({required this.category, required this.type});
}