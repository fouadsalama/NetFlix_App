import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen/widgets/headline_home.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_item_home.dart';
import 'package:netflix_app/widgets/custom_app_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomAppBar(),
          HeadlinesScreen(text: 'Now Playing'),
          LIstViewItem(),
        ],
      ),
    );
  }
}
