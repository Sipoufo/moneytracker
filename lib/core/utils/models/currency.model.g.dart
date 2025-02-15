// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyModelAdapter extends TypeAdapter<CurrencyModel> {
  @override
  final int typeId = 7;

  @override
  CurrencyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyModel(
      symbol: fields[0] as String,
      name: fields[1] as String,
      symbolNative: fields[2] as String,
      decimalDigits: fields[3] as double?,
      rounding: fields[4] as double?,
      code: fields[5] as String,
      namePlural: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbolNative)
      ..writeByte(3)
      ..write(obj.decimalDigits)
      ..writeByte(4)
      ..write(obj.rounding)
      ..writeByte(5)
      ..write(obj.code)
      ..writeByte(6)
      ..write(obj.namePlural);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
