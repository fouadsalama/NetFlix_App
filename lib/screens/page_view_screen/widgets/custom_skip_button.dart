import 'package:flutter/material.dart';
import 'package:netflix_app/screens/welcome_screen/welcome_screen.dart';

class CustomSkipButton extends StatelessWidget {
  const CustomSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
