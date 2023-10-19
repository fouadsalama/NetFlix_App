import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';

import '../../../constants/constants.dart';

class DisplayBackDropPath extends StatelessWidget {
  const DisplayBackDropPath({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowImageInDetails(movie: movie),
        SafeArea(
          child: IconButton(
            color: kSecondColor,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
      ],
    );
  }
}

class ShowImageInDetails extends StatelessWidget {
  const ShowImageInDetails({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    if (movie.backdropPath != null) {
      return Container(
        height: MediaQuery.of(context).size.height * .45,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height * .45,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            ),
          ),
        ),
      );
    }
  }
}
