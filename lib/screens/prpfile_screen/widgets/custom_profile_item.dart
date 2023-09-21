import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'name_and_email_profile.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 20),
        ProfileInfoAndEdit(),
        SizedBox(height: 30),
        Divider(
          color: kSecondColor,
        ),
        SizedBox(
          height: 25,
        ),
        CustomProfileElements(
          image: 'assets/images/folder.png',
          text: 'Downloads',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/location.png',
          text: 'Location',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/press-button.png',
          text: 'Subscribe',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/clock.png',
          text: 'Clear History',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/trash.png',
          text: 'Clear Cache',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/battery.png',
          text: 'Display',
          color: kSecondColor,
        ),
        CustomProfileElements(
          image: 'assets/images/logout.png',
          text: 'Log Out',
          color: kMainColor,
        ),
      ],
    );
  }
}

class ProfileInfoAndEdit extends StatelessWidget {
  const ProfileInfoAndEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 85 / 2,
              backgroundColor: kBackgroundColor,
              backgroundImage: AssetImage('assets/images/fouad.jpg'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: NameAndEmailProfile(),
            ),
          ],
        ),
        IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              'assets/images/edit.png',
              color: kSecondColor,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomProfileElements extends StatelessWidget {
  const CustomProfileElements({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
    required this.color,
  });
  final String image;
  final String text;
  final Color color;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  image,
                  color: color,
                ),
              ),
              const SizedBox(width: 37 - 26),
              Text(
                text,
                style: const TextStyle(
                  color: kSecondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: kSecondColor,
            ),
          ),
        ],
      ),
    );
  }
}
