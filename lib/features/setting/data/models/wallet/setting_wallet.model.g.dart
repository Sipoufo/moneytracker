// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_wallet.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingWalletModelAdapter extends TypeAdapter<SettingWalletModel> {
  @override
  final int typeId = 3;

  @override
  SettingWalletModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingWalletModel(
      id: fields[0] as int,
      name: fields[1] as String,
      country: fields[2] as CountryInfos,
      amount: fields[3] as double,
      isSelected: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingWalletModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingWalletModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
