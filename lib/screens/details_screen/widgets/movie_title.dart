import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:netflix_app/models/movIe_model.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
          builder: (context, state) {
            final isFavorite = BlocProvider.of<FavoriteMovieCubit>(context)
                .favoriteMovies
                .contains(movie);

            return IconButton(
              onPressed: () {
                BlocProvider.of<FavoriteMovieCubit>(context)
                    .toggleFavorite(movie);
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
