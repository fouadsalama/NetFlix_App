import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/cubits/favorite_movie/favorite_movie_cubit.dart';

import '../../../models/movIe_model.dart';
import 'custom_favorite_item.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShowImage(movie: movie),
        IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteMovieCubit>(context).toggleFavorite(movie);
          },
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.delete,
            color:
                Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
            // size: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 183, left: 21, right: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFavoriteItem(
                image: 'assets/images/play.png',
                text: 'Play',
                movie: movie,
              ),
              const Icon(
                Icons.favorite,
                color: kMainColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowImage extends StatelessWidget {
  const ShowImage({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    if (movie.backdropPath != null) {
      return Container(
        width: double.infinity,
        height: 219,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black38,
              BlendMode.hardLight,
            ),
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}'),
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        height: 219,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.black38,
              BlendMode.hardLight,
            ),
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
          ),
        ),
      );
    }
  }
}
