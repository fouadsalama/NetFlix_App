import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../services/save_and_load_data.dart';
import '../profile_details_screen/profile_details_screen.dart';
import 'name_and_email_profile.dart';

class ProfileInfoAndEdit extends StatelessWidget {
  const ProfileInfoAndEdit({
    super.key,
  });
  final String image = 'assets/images/newUser.jpeg';
  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email;
    return FutureBuilder(
        future: fetchNameFromFirestore(email!),
        builder: (context, snapshot) {
          String name = snapshot.data ?? 'user';
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return ProfileDetailsScreen(
                  name: name,
                  email: email,
                  image: image,
                );
              }));
            },
            child: Container(
              height: 90,
              width: 378,
              decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: CircleAvatar(
                          radius: 75 / 2,
                          backgroundColor: kBackgroundColor,
                          backgroundImage: AssetImage(image),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, left: 16),
                        child: NameAndEmailProfile(
                          name: name,
                          email: email,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
