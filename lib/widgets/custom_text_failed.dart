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
    this.onSaved,
    this.hintColor = kSecondColor,
  });
  final String hintText;
  final bool obscureText;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final void Function(String)? onSaved;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color color;
  final Color hintColor;

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
        fillColor: Theme.of(context).highlightColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 34, vertical: 17),
        hintText: hintText,
        hintStyle: TextStyle(color: hintColor),
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
