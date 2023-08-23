import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/background_image.dart';

import 'widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static String id = 'Forget_Screen';
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(image: 'assets/images/3.png'),
        Scaffold(
          backgroundColor: Colors.black54,
          body: ForgetPasswordBogy(),
        ),
      ],
    );
  }
}
