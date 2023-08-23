import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/background_image.dart';
import 'widgets/new_password_body.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});
  static String id = 'New_password';
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(image: 'assets/images/angel_has_fallen_xxlg 1.png'),
        Scaffold(
          backgroundColor: Colors.black54,
          body: NewPasswordBody(),
        ),
      ],
    );
  }
}
