import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/helper/lunch_url.dart';
import 'package:netflix_app/screens/details_screen/widgets/movie_description.dart';
import 'package:netflix_app/widgets/custom_button.dart';

import 'widgets/backdrop_path.dart';
import 'widgets/date_and_rate.dart';
import 'widgets/movie_title.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.backdropPath,
    required this.title,
    required this.rate,
    required this.time,
    required this.desc,
    required this.videoUrl,
  });
  final String backdropPath;
  final String title;
  final dynamic rate;
  final String time;
  final String desc;
  final String videoUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DisplayBackDropPath(backdropPath: backdropPath),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 20),
              child: Column(
                children: [
                  MovieTitle(title: title),
                  const SizedBox(height: 20),
                  MovieDateAndRate(time: time, rate: rate),
                  const SizedBox(height: 10),
                  MovieDescription(desc: desc),
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
