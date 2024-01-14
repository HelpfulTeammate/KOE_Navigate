import 'dart:async';
import 'package:flutter/material.dart';
import 'package:koe_navigate/Screen/Search/current.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const currentLocation()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/KOENavi.png',
            height: 200, width: 200, fit: BoxFit.fitWidth),
      ),
    );
  }
}
