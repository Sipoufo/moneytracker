import 'package:hive_flutter/hive_flutter.dart';

part 'transaction_category_type.enum.g.dart';

@HiveType(typeId: 12)
enum TransactionCategoryTypeEnum {
  @HiveField(00)
  income("income", "Entrées"),
  @HiveField(01)
  expenses("expenses", "Dépenses"),
  ;

  const TransactionCategoryTypeEnum(this.valueEn, this.valueFr);

  final String valueEn;
  final String valueFr;
}