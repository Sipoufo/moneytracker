// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionModelAdapter extends TypeAdapter<TransactionModel> {
  @override
  final int typeId = 11;

  @override
  TransactionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionModel(
      id: fields[0] as int,
      name: fields[1] as String,
      wallet: fields[2] as SettingWalletModel,
      category: fields[3] as TransactionCategoryModel,
      amount: fields[4] as double,
      amountIcon: fields[5] as String,
      dateTime: fields[6] as DateTime,
      note: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.wallet)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.amountIcon)
      ..writeByte(6)
      ..write(obj.dateTime)
      ..writeByte(7)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
