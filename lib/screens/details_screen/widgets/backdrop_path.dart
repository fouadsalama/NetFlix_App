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
        Container(
          height: MediaQuery.of(context).size.height * .45,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
              ),
            ),
          ),
        ),
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
