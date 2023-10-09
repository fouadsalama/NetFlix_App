import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/models/movIe_model.dart';

class MovieDateAndRate extends StatelessWidget {
  const MovieDateAndRate({
    super.key,
    required this.movie,
  });

  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              movie.date.substring(0, 4),
              style: const TextStyle(
                color: kSecondColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(width: 5),
        Text(
          movie.voteAverage.toString(),
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
