import 'package:flutter/material.dart';
import 'package:netflix_app/screens/forget_password_screen/forget_password_screen.dart';

import '../../../constants/constants.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

Color? color;

class _RememberMeState extends State<RememberMe> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 11,
            backgroundColor: kSecondColor,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'Remember me',
          style: TextStyle(
            color: kSecondColor,
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          // textAlign: TextAlign.left,
        ),
        const SizedBox(
          width: Checkbox.width,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ForgetPasswordScreen.id);
            },
            child: Text(
              'forget password?'.toUpperCase(),
              style: const TextStyle(
                color: kSecondColor,
                fontSize: 15,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.7,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
