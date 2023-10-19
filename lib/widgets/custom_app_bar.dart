import 'package:flutter/material.dart';

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
        SizedBox(
          height: 60,
          child: Image.asset(kFlexLOgo),
        ),
        IconButton(
          splashColor: Colors.transparent,
          onPressed: () {},
          icon: Image.asset('assets/images/night-mode.png',
              color: Theme.of(context).unselectedWidgetColor),
        ),
      ],
    );
  }
}
