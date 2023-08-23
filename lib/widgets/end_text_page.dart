import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TextEndPage extends StatelessWidget {
  const TextEndPage({
    super.key,
    required this.text,
    required this.firstText,
    this.onTap,
  });
  final String text;
  final String firstText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: const TextStyle(
            color: kSecondColor,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: kMainColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
