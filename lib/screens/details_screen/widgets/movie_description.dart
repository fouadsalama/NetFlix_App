import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            desc,
            maxLines: 5,
            style: const TextStyle(
              color: kSecondColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
