import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home_screen/widgets/headline_home.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_trending_item_home.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_top_movie.dart';
import '../../../widgets/custom_app_bar.dart';
import 'list_view_popular_movie.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          CustomAppBar(),
          HeadlinesScreen(text: 'Popular Now'),
          ListViewItem(),
          SizedBox(height: 25),
          HeadlinesScreen(text: 'Upcoming Movies'),
          ListViewPopularMovie(),
          SizedBox(height: 25),
          HeadlinesScreen(text: 'Top Movies'),
          ListViewTopMovie(),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
