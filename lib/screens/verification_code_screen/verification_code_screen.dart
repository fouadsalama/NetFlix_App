import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/background_image.dart';

import 'widgets/verification_code_body.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});
  static String id = 'verification_code';
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(image: 'assets/images/angel_has_fallen_xxlg 1.png'),
        Scaffold(
          backgroundColor: Colors.black54,
          body: VerificationCodeBody(),
        ),
      ],
    );
  }
}
