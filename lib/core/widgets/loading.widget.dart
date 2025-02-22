import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/pictures/loading/loading.gif",
      height: 200,
      width: 200,
      fit: BoxFit.contain,
    );
  }
}
