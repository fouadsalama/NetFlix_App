import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen/widgets/headline_home.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_Items.dart';
import '../../../widgets/custom_app_bar.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({
    super.key,
  });
  static String id = 'HomeBodyScreen';
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomAppBar(),
          HeadlinesScreen(text: 'Now Playing'),
          ListViewItems(movie: 'now_playing'),
          SizedBox(height: 25),
          HeadlinesScreen(text: 'Popular Movies'),
          ListViewItems(movie: 'popular'),
          SizedBox(height: 25),
          HeadlinesScreen(text: 'Upcoming Movies'),
          ListViewItems(movie: 'upcoming'),
          SizedBox(height: 25),
          HeadlinesScreen(text: 'Top Movie'),
          ListViewItems(movie: 'top_rated'),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
