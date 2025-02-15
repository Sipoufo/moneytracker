// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flag.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlagModelAdapter extends TypeAdapter<FlagModel> {
  @override
  final int typeId = 6;

  @override
  FlagModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FlagModel(
      emoji: fields[0] as String,
      unicode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FlagModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.emoji)
      ..writeByte(1)
      ..write(obj.unicode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlagModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
