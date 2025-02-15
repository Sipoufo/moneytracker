import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category.model.g.dart';
/// Model for category of financial depends
/// [name] represent the name of category
/// [picture] represent the picture of category
/// [backgroundColor] represent the background color of category
@HiveType(typeId: 08)
class CategoryModel {
  @HiveField(00)
  final String name;
  @HiveField(01)
  final String picture;
  @HiveField(02)
  final int backgroundColor;

  CategoryModel({
    required this.name,
    required this.picture,
    required this.backgroundColor,
  });
}
