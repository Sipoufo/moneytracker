import 'package:hive_flutter/hive_flutter.dart';

part 'currency.model.g.dart';

/// This class is use to mange flag of country
/// [symbol] represent the symbol of currency
/// [name] represent the name of currency
/// [symbolNative] represent the native symbol of currency
/// [decimalDigits] represent the default decimal digit of currency
/// [rounding] represent rounding
/// [code] represent the code of currency
/// [namePlural] represent the full name of currency
@HiveType(typeId: 07)
class CurrencyModel {
  @HiveField(00)
  final String symbol;
  @HiveField(01)
  final String name;
  @HiveField(02)
  final String symbolNative;
  @HiveField(03)
  final double? decimalDigits;
  @HiveField(04)
  final double? rounding;
  @HiveField(05)
  final String code;
  @HiveField(06)
  final String namePlural;

  CurrencyModel({
    required this.symbol,
    required this.name,
    required this.symbolNative,
    this.decimalDigits,
    this.rounding,
    required this.code,
    required this.namePlural,
  });

  /// Use to convert json data to object
  factory CurrencyModel.fromJson(dynamic item) {
    return CurrencyModel(
      symbol: item["symbol"],
      name: item["name"],
      symbolNative: item["symbol_native"],
      decimalDigits: double.parse("${item["decimal_digits"]}"),
      rounding: double.parse("${item["rounding"]}"),
      code: item["code"],
      namePlural: item["name_plural"],
    );
  }
}
