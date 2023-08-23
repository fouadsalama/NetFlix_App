import 'package:flutter/material.dart';
import 'package:netflix_app/widgets/logo_screens.dart';

import '../constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: kSecondColor,
          ),
        ),
        const SizedBox(
          height: 95,
          width: 95,
          child: Logo(),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: kSecondColor,
            ))
      ],
    );
  }
}
