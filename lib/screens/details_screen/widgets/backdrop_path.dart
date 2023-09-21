import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DisplayBackDropPath extends StatelessWidget {
  const DisplayBackDropPath({
    super.key,
    required this.backdropPath,
  });

  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                backdropPath,
              ),
            ),
          ),
        ),
        SafeArea(
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: kSecondColor,
            ),
          ),
        ),
      ],
    );
  }
}
