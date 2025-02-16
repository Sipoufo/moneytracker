import 'package:hive_flutter/adapters.dart';

part 'transaction_category.model.g.dart';

@HiveType(typeId: 10)
class TransactionCategoryModel {
  @HiveField(00)
  final String name;

  @HiveField(01)
  final String type;

  TransactionCategoryModel({required this.name, required this.type});
}