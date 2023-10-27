import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/welcome_screen/welcome_screen.dart';

Future<void> signOut(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, WelcomeScreen.id);
  } catch (e) {
    throw Exception('Error while signing out: $e');
  }
}
