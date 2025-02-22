// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionCategoryModelAdapter
    extends TypeAdapter<TransactionCategoryModel> {
  @override
  final int typeId = 10;

  @override
  TransactionCategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionCategoryModel(
      category: fields[0] as CategoryEnum,
      type: fields[1] as TransactionCategoryTypeEnum,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionCategoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionCategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
