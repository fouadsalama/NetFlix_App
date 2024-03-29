import 'package:flutter/material.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(image),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 45,
          ),
        )
      ],
    );
  }
}
