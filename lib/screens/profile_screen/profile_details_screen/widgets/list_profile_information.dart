import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class ListProfileInfo extends StatelessWidget {
  const ListProfileInfo({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    required this.text,
    this.trailingIcon,
  });
  final String hintText;
  final IconData leadingIcon;
  final String text;
  final IconData? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 30,
          color: Theme.of(context).hintColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: Icon(
          trailingIcon,
          color: kMainColor,
        ),
      ),
    );
  }
}
