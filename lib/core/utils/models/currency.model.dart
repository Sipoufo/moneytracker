/// This class is use to mange flag of country
/// [symbol] represent the symbol of currency
/// [name] represent the name of currency
/// [symbolNative] represent the native symbol of currency
/// [decimalDigits] represent the default decimal digit of currency
/// [rounding] represent rounding
/// [code] represent the code of currency
/// [namePlural] represent the full name of currency
class CurrencyModel {
  final String symbol;
  final String name;
  final String symbolNative;
  final double? decimalDigits;
  final double? rounding;
  final String code;
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
