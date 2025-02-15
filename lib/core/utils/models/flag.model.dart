import 'package:hive_flutter/hive_flutter.dart';

part 'flag.model.g.dart';

/// This class is use to mange flag of country
/// [emoji] represent the image of country
/// [unicode] (Unicode standard) defines the characters and code points corresponding to letters,
/// syllables, ideograms, punctuation marks, special characters and numbers.
@HiveType(typeId: 06)
class FlagModel {
  @HiveField(00)
  final String emoji;
  @HiveField(01)
  final String unicode;

  FlagModel({
    required this.emoji,
    required this.unicode,
  });

  /// Use to convert json data to object
  factory FlagModel.fromJson(dynamic item) {
    return FlagModel(
      emoji: item["emoji"],
      unicode: item["unicode"],
    );
  }
}
