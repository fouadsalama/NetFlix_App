import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class HeadlinesScreen extends StatelessWidget {
  const HeadlinesScreen({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const Text(
            'See more...',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: kMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
