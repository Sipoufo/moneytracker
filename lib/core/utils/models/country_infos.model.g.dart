// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_infos.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryInfosAdapter extends TypeAdapter<CountryInfos> {
  @override
  final int typeId = 5;

  @override
  CountryInfos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryInfos(
      name: fields[0] as String,
      isoCode: fields[1] as String,
      phoneCode: fields[2] as String,
      flag: fields[3] as FlagModel,
      currency: fields[4] as CurrencyModel,
    );
  }

  @override
  void write(BinaryWriter writer, CountryInfos obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isoCode)
      ..writeByte(2)
      ..write(obj.phoneCode)
      ..writeByte(3)
      ..write(obj.flag)
      ..writeByte(4)
      ..write(obj.currency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryInfosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
