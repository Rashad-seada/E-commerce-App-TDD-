import 'dart:async';

import 'package:flutter/material.dart';

import '01_onBoarding_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3),() =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OnBoardingScreen()))
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          //child: ,
        )
    );
  }
}
