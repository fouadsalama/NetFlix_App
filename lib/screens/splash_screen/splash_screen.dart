// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen/home_screen.dart';
import 'package:netflix_app/screens/page_view_screen/page_view_screen.dart';
import 'widgets/splash_screen_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'Splash Screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final userEmail = FirebaseAuth.instance.currentUser?.email ?? "No User Found";

  Future<bool> isEmailRegistered(String email) async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null && user.email == email;
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      checkEmailRegistration();
    });
    super.initState();
  }

  void checkEmailRegistration() async {
    final emailRegistered = await isEmailRegistered(userEmail);
    if (emailRegistered) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.id);
    } else {
      Navigator.of(context).pushReplacementNamed(PageViewScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),
    );
  }
}
