import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextFailed extends StatelessWidget {
  const CustomTextFailed({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.controller,
    this.suffixIcon,
    this.color = kSecondColor,
  });
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Failed is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: kSecondColor,
      style: const TextStyle(
        color: kSecondColor,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: kSecondColor.withOpacity(20 / 100),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 34, vertical: 17),
        hintText: hintText,
        hintStyle: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
