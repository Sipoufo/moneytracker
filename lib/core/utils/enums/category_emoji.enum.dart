import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';

part 'category_emoji.enum.g.dart';

/// Model for category of financial depends
/// [name] represent the name of category's emoji
/// [backgroundColor] represent the background color of category's emoji
/// [nameEn] represent english name of category's emoji
/// [nameFr] represent french name of category's emoji
@HiveType(typeId: 08)
enum CategoryEnum {
  @HiveField(00)
  education("🎓", ColorsUtils.lapis_lazuli, "Education", "Education"),

  @HiveField(01)
  salary("💲", ColorsUtils.malibu, "Salary", "Salaire"),

  @HiveField(02)
  groceries("🛒", ColorsUtils.gossip, "Groceries", "Boutique"),

  @HiveField(03)
  gas("⛽", ColorsUtils.broom, "Gas", "Carburant"),

  @HiveField(04)
  rent("🏡️", ColorsUtils.atomic_tangerine, "Rent", "Location"),

  @HiveField(05)
  gym("💪", ColorsUtils.reseda_green, "Gym", "Gym"),

  @HiveField(06)
  restaurant("🍴", ColorsUtils.puce, "Restaurant", "Restaurant"),

  @HiveField(07)
  vacation("🏖️", ColorsUtils.china_rose, "Vacation", "Vacance"),

  @HiveField(08)
  travel("✈️", ColorsUtils.orchid_pink, "Travel", "Voyage"),

  @HiveField(09)
  gift("🎁", ColorsUtils.dark_purple, "Gift", "Cadeau"),

  @HiveField(10)
  investments("📈", ColorsUtils.payne_gray, "Investments", "Investissements"),

  @HiveField(11)
  savings("💾", ColorsUtils.tea_rose, "Savings", "Epargnes"),

  @HiveField(12)
  entertainment("🎮", ColorsUtils.royal_blue, "Entertainment", "Divertissement"),

  @HiveField(13)
  other("🙂", ColorsUtils.black_bean, "Other", "Autre"),

  @HiveField(14)
  internet("ᯤ", ColorsUtils.red_cmyk, "Internet", "Internet"),

  @HiveField(15)
  taxi("🚕", ColorsUtils.lapis_lazuli, "Taxi", "Taxi"),
  ;

  const CategoryEnum(this.emoji, this.backgroundColor, this.nameEn, this.nameFr);

  final String emoji;
  final Color backgroundColor;
  final String nameEn;
  final String nameFr;
}