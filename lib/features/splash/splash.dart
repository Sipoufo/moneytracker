import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moneytracker/core/utils/constants/colors.util.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "/onboarding")
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtils.primary_5,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pictures/logo/logo.png"),
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
