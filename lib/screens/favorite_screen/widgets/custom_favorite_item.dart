import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomFavoriteItem extends StatelessWidget {
  const CustomFavoriteItem({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: kSecondColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              image,
              color: kSecondColor,
            ),
          ),
        ],
      ),
    );
  }
}
