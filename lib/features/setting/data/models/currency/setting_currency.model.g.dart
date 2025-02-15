// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_currency.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingCurrencyModelAdapter extends TypeAdapter<SettingCurrencyModel> {
  @override
  final int typeId = 4;

  @override
  SettingCurrencyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingCurrencyModel(
      country: fields[0] as CountryInfos,
    );
  }

  @override
  void write(BinaryWriter writer, SettingCurrencyModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingCurrencyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
