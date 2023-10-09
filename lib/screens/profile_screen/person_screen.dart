import 'package:flutter/material.dart';
import 'widgets/custom_profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.grey,
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
