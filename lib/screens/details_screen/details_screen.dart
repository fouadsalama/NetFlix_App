import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/helper/lunch_url.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/screens/details_screen/widgets/movie_description.dart';
import 'package:netflix_app/widgets/custom_button.dart';

import 'widgets/backdrop_path.dart';
import 'widgets/date_and_rate.dart';
import 'widgets/movie_title.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.videoUrl,
    required this.movie,
  });
  final String videoUrl;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DisplayBackDropPath(movie: movie),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Column(
                children: [
                  MovieTitle(
                    movie: movie,
                  ),
                  const SizedBox(height: 20),
                  MovieDateAndRate(
                    movie: movie,
                  ),
                  const SizedBox(height: 10),
                  MovieDescription(movie: movie),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomButton(
                      text: 'PLAY',
                      color: kMainColor,
                      onTap: () {
                        lunchUrl(videoUrl: videoUrl);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
