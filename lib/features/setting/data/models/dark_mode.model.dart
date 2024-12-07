import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

/// Use to manage the state accross the app
@HiveType(typeId: 01)
class DarkModeModel {
  @HiveField(00)
  final String id;

  @HiveField(02)
  final ThemeMode themeMode;

  const DarkModeModel({
    required this.id,
    required this.themeMode,
  });
}
