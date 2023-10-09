import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen/home_screen.dart';

import 'widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'Splash Screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
