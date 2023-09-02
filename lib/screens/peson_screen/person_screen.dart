import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';

import 'widgets/custom_profile_item.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 26, right: 26),
        child: CustomProfileItem(),
      ),
    );
  }
}
