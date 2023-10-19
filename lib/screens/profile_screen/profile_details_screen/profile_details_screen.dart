import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/cubits/user_name/user_name_cubit.dart';
import 'package:netflix_app/widgets/custom_button.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = context.select((UserCubit userName) => userName.state);
    final emailUser = context.select((EmailCubit emailUser) => emailUser.state);
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
                        return const ImageProfile();
                      }));
                    },
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          radius: 140 / 2,
                          backgroundImage:
                              AssetImage('assets/images/fouad.jpg'),
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
                  EditProfile(
                    hintText: 'Name',
                    icon: Icons.person,
                    text: userName,
                    trailingIcon: Icons.edit,
                    onTap: () {
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
                            return const EditBottomSheet();
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
                    icon: Icons.email_outlined,
                    text: emailUser,
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

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
    required this.hintText,
    required this.icon,
    required this.text,
    this.trailingIcon,
    this.onTap,
  });
  final String hintText;
  final IconData icon;
  final String text;
  final IconData? trailingIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListProfileInfo(
        hintText: hintText,
        leadingIcon: icon,
        text: text,
        trailingIcon: trailingIcon,
      ),
    );
  }
}

class ListProfileInfo extends StatelessWidget {
  const ListProfileInfo({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    required this.text,
    this.trailingIcon,
  });
  final String hintText;
  final IconData leadingIcon;
  final String text;
  final IconData? trailingIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 30,
          color: Theme.of(context).hintColor,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
            Text(text),
          ],
        ),
        trailing: Icon(
          trailingIcon,
          color: kMainColor,
        ),
      ),
    );
  }
}

class EditBottomSheet extends StatelessWidget {
  const EditBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Your Name',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: name,
              autofocus: true,
              cursorColor: Theme.of(context).highlightColor,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).hintColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Save',
              color: kMainColor,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Image.asset('assets/images/fouad.jpg'),
      ),
    );
  }
}
