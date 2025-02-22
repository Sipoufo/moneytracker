// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category_type.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionCategoryTypeEnumAdapter
    extends TypeAdapter<TransactionCategoryTypeEnum> {
  @override
  final int typeId = 12;

  @override
  TransactionCategoryTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionCategoryTypeEnum.income;
      case 1:
        return TransactionCategoryTypeEnum.expenses;
      default:
        return TransactionCategoryTypeEnum.income;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionCategoryTypeEnum obj) {
    switch (obj) {
      case TransactionCategoryTypeEnum.income:
        writer.writeByte(0);
        break;
      case TransactionCategoryTypeEnum.expenses:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionCategoryTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
