import 'package:flutter/material.dart';
import 'package:netflix_app/helper/lunch_url.dart';
import 'package:netflix_app/models/movIe_model.dart';
import '../../../constants/constants.dart';

class CustomFavoriteItem extends StatelessWidget {
  const CustomFavoriteItem({
    super.key,
    required this.text,
    required this.image,
    required this.movie,
  });
  final String text;
  final String image;
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final videoUrl =
            'https://embed.smashystream.com/playere.php?tmdb=${movie.id}';
        lunchUrl(videoUrl: videoUrl);
      },
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: kSecondColor,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              image,
              color: kSecondColor,
            ),
          ),
        ],
      ),
    );
  }
}
