import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koe_navigate/Screen/splash.dart';
import 'package:koe_navigate/widget.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
    WidgetsFlutterBinding
      .ensureInitialized();
  await initialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
    .then((value) => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
      seedColor: green),
      useMaterial3: true),
      home: const PopScope(
        canPop: false,
        child: SafeArea(
          child: SplashPage(),
          ),
        ),
      ),
    )
  );
}
