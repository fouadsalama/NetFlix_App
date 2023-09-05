import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/screens/favorite_screen/widgets/container_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Center(
          child: Text(
            'WishList',
            style: TextStyle(
              color: kSecondColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 30, left: 26, right: 26),
            child: ContainerItem(),
          );
        },
      ),
    );
  }
}
