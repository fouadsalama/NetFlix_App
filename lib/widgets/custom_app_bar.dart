import 'package:flutter/material.dart';
import 'package:netflix_app/provider/theme_changer.dart';
import 'package:provider/provider.dart';

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
        Consumer<ThemeChanger>(builder: (context, theme, child) {
          return IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              theme.toggleTheme();
            },
            icon: Image.asset('assets/images/night-mode.png',
                color: Theme.of(context).unselectedWidgetColor),
          );
        }),
      ],
    );
  }
}
