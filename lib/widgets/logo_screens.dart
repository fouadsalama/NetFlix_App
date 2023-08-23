import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kLogo,
      height: 300,
    );
  }
}
