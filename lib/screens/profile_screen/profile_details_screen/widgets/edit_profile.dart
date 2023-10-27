import 'package:flutter/material.dart';

import 'list_profile_information.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
    required this.hintText,
    required this.icon,
    required this.text,
    this.trailingIcon,
    this.onTap,
  });
  final String hintText;
  final IconData icon;
  final String text;
  final IconData? trailingIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListProfileInfo(
        hintText: hintText,
        leadingIcon: icon,
        text: text,
        trailingIcon: trailingIcon,
      ),
    );
  }
}
