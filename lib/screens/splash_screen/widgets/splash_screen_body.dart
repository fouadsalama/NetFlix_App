import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        Center(
          child: Image.asset(
            kLogo,
            height: MediaQuery.of(context).size.height * .45,
            width: double.infinity,
          ),
        ),
        const CircularProgressIndicator(
          color: kMainColor,
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
