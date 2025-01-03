import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes_app_with_api/screen/quotes_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.0;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    /// for scale
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _scale = _scale == 0.0 ? 1.0 : 0.0;
      });
    });

    /// for opacity
    Timer(const Duration(milliseconds: 1800), () {
      setState(() {
        isVisible = !isVisible;
      });
    });

    /// Navigate to main screen
    Timer(const Duration(milliseconds: 2300), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const QuotesScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(seconds: 1),
              scale: _scale,
              child: Image.asset(
                "assets/images/quote.png",
                height: 300,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 1800),
              opacity: isVisible ? 1.0 : 0.0,
              child: const Text(
                "Quotes",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "primary"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// Complete
/// Final Test App
