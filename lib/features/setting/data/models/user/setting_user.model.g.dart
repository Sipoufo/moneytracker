// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_user.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingUserModelAdapter extends TypeAdapter<SettingUserModel> {
  @override
  final int typeId = 2;

  @override
  SettingUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingUserModel(
      id: fields[0] as int,
      fullName: fields[1] as String,
      userName: fields[2] as String,
      email: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SettingUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
