import 'package:flutter/material.dart';
import 'package:netflix_app/screens/profile_screen/widgets/Profile_info_and_edit.dart';
import 'package:netflix_app/screens/profile_screen/widgets/custom_profile_elements.dart';
import 'package:netflix_app/widgets/custom_button.dart';
import '../../../constants/constants.dart';
import '../../../services/sign_out.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
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
            signOut(context);
          },
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
