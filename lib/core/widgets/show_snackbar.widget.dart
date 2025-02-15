import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';

void showSnackBar(BuildContext context, String content, {bool isError = true}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError ? ColorsUtils.danger_5 : ColorsUtils.primary_5,
      ),
    );
}
