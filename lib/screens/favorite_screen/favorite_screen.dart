import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/favorite_movie/favorite_movie_cubit.dart';
import 'package:netflix_app/screens/details_screen/details_screen.dart';

import 'widgets/container_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'WishList',
            style: TextStyle(
              color: Theme.of(context).unselectedWidgetColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: BlocBuilder<FavoriteMovieCubit, FavoriteMovieState>(
          builder: (context, state) {
        final favoriteMovies =
            BlocProvider.of<FavoriteMovieCubit>(context).favoriteMovies;
        if (favoriteMovies.isNotEmpty && state is FavoriteMovieUpdated) {
          return ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies.elementAt(index);
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, top: 30, left: 26, right: 26),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(
                            videoUrl:
                                'https://embed.smashystream.com/playere.php?tmdb=${movie.id}',
                            movie: movie,
                          );
                        },
                      ),
                    );
                  },
                  child: FavoriteItems(movie: movie),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: Text(
              'you have no favorites yet \nstart adding some!',
              textAlign: TextAlign.center,
            ),
          );
        }
      }),
    );
  }
}
