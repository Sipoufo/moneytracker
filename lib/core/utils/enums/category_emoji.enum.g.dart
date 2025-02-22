// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_emoji.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryEnumAdapter extends TypeAdapter<CategoryEnum> {
  @override
  final int typeId = 8;

  @override
  CategoryEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryEnum.education;
      case 1:
        return CategoryEnum.salary;
      case 2:
        return CategoryEnum.groceries;
      case 3:
        return CategoryEnum.gas;
      case 4:
        return CategoryEnum.rent;
      case 5:
        return CategoryEnum.gym;
      case 6:
        return CategoryEnum.restaurant;
      case 7:
        return CategoryEnum.vacation;
      case 8:
        return CategoryEnum.travel;
      case 9:
        return CategoryEnum.gift;
      case 10:
        return CategoryEnum.investments;
      case 11:
        return CategoryEnum.savings;
      case 12:
        return CategoryEnum.entertainment;
      case 13:
        return CategoryEnum.other;
      case 14:
        return CategoryEnum.internet;
      case 15:
        return CategoryEnum.taxi;
      default:
        return CategoryEnum.education;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryEnum obj) {
    switch (obj) {
      case CategoryEnum.education:
        writer.writeByte(0);
        break;
      case CategoryEnum.salary:
        writer.writeByte(1);
        break;
      case CategoryEnum.groceries:
        writer.writeByte(2);
        break;
      case CategoryEnum.gas:
        writer.writeByte(3);
        break;
      case CategoryEnum.rent:
        writer.writeByte(4);
        break;
      case CategoryEnum.gym:
        writer.writeByte(5);
        break;
      case CategoryEnum.restaurant:
        writer.writeByte(6);
        break;
      case CategoryEnum.vacation:
        writer.writeByte(7);
        break;
      case CategoryEnum.travel:
        writer.writeByte(8);
        break;
      case CategoryEnum.gift:
        writer.writeByte(9);
        break;
      case CategoryEnum.investments:
        writer.writeByte(10);
        break;
      case CategoryEnum.savings:
        writer.writeByte(11);
        break;
      case CategoryEnum.entertainment:
        writer.writeByte(12);
        break;
      case CategoryEnum.other:
        writer.writeByte(13);
        break;
      case CategoryEnum.internet:
        writer.writeByte(14);
        break;
      case CategoryEnum.taxi:
        writer.writeByte(15);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
