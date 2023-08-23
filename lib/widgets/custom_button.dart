import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
  });

  final void Function()? onTap;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color: kMainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: kTextStyle,
          ),
        ),
      ),
    );
  }
}
