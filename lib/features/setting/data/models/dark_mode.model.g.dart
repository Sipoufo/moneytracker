// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark_mode.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DarkModeModelAdapter extends TypeAdapter<DarkModeModel> {
  @override
  final int typeId = 1;

  @override
  DarkModeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DarkModeModel(
      id: fields[0] as String,
      themeMode: fields[2] as ThemeMode,
    );
  }

  @override
  void write(BinaryWriter writer, DarkModeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.themeMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DarkModeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
