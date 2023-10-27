import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/cubits/update_name/update_name_cubit.dart';
import 'package:netflix_app/screens/profile_screen/profile_details_screen/widgets/image_profile.dart';
import 'widgets/edit_bottom_sheet.dart';
import 'widgets/edit_profile.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.image});
  final String name, email, image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).highlightColor,
        title: Text(
          'Profile',
          style: TextStyle(color: Theme.of(context).unselectedWidgetColor),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ImageProfile(
                          image: image,
                        );
                      }));
                    },
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 140 / 2,
                          backgroundImage: AssetImage(image),
                        ),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.black87,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: kSecondColor,
                                  size: 20,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  BlocBuilder<UpdateNameCubit, String>(
                    builder: (context, state) {
                      return EditProfile(
                          hintText: 'Name',
                          text: state.isEmpty ? name : state,
                          icon: Icons.person,
                          trailingIcon: Icons.edit,
                          onTap: () {
                            final userName = state.isEmpty ? name : state;
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                builder: (context) {
                                  return EditBottomSheet(
                                    name: userName,
                                    email: email,
                                  );
                                });
                          });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 85),
                    child: Divider(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  EditProfile(
                    hintText: 'Email',
                    text: email,
                    icon: Icons.email_outlined,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
