// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/screens/profile_screen/profile_details_screen/profile_details_screen.dart';
import 'package:netflix_app/screens/welcome_screen/welcome_screen.dart';
import 'package:netflix_app/widgets/custom_button.dart';
import '../../../constants/constants.dart';
import 'name_and_email_profile.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> signOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacementNamed(context, WelcomeScreen.id);
      } catch (e) {
        throw Exception('Error while signing out: $e');
      }
    }

    return ListView(
      children: [
        const SizedBox(height: 20),
        const ProfileInfoAndEdit(),
        const SizedBox(height: 30),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 25,
        ),
        const CustomProfileElements(
          image: 'assets/images/location.png',
          text: 'Location',
        ),
        const CustomProfileElements(
          image: 'assets/images/press-button.png',
          text: 'Subscribe',
        ),
        const CustomProfileElements(
          image: 'assets/images/clock.png',
          text: 'Clear History',
        ),
        const CustomProfileElements(
          image: 'assets/images/trash.png',
          text: 'Clear Cache',
        ),
        const CustomProfileElements(
          image: 'assets/images/battery.png',
          text: 'Display',
        ),
        CustomButton(
          text: 'Log Out',
          color: kMainColor,
          onTap: () {
            signOut();
          },
        ),
        const SizedBox(height: 50),
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const ProfileDetailsScreen();
        }));
      },
      child: Container(
        height: 90,
        width: 378,
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    radius: 75 / 2,
                    backgroundColor: kBackgroundColor,
                    backgroundImage: AssetImage('assets/images/fouad.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: NameAndEmailProfile(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomProfileElements extends StatelessWidget {
  const CustomProfileElements({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
  });
  final String image;
  final String text;

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
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
              const SizedBox(width: 37 - 26),
              Text(
                text,
                style: const TextStyle(
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
            ),
          ),
        ],
      ),
    );
  }
}
