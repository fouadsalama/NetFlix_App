import 'package:flutter/material.dart';
import 'package:netflix_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:netflix_app/screens/sign_up_screen/sign_up_screen.dart';

import '../../../constants/constants.dart';
import '../../../widgets/custom_button.dart';

class WelcomeScreenItems extends StatelessWidget {
  const WelcomeScreenItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/Ellipse 5.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(kLogo),
                        const Padding(
                          padding: EdgeInsets.only(top: 240, left: 80),
                          child: Text(
                            'See what\'s next.',
                            style: TextStyle(
                              color: kSecondColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.id);
                      },
                      text: 'Sign In',
                      color: kMainColor,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.id);
                      },
                      text: 'Sign Up',
                      color: Colors.transparent,
                      textColor: kMainColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
