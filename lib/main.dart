import 'package:flutter/material.dart';
import 'package:quotes_app_with_api/screen/quotes_screen.dart';
import 'package:quotes_app_with_api/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen()
    );
  }
}


/// IN THIS VIDEO WE CREATE
/// ____________ Quotes App___________________///
/// with API Integrations
/// ____________Dummy API HIT________________///
/// Learn to Integrate API
/// SIMPLE STEPS
/// STEPS 1
/// PROJECT SETUP => DONE
/// STEPS 2
/// CREATE MODEL => DONE
/// STEPS 3
/// HIT API ANS SHOW DATA ON THE SCREEN => DONE
///
/// STEP 3
/// CREATE SIMPLE SPLASH SCREEN => Complete
/// FINAL TEST
///
