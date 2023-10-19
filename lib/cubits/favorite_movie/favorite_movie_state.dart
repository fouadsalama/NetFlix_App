part of 'favorite_movie_cubit.dart';

sealed class FavoriteMovieState {
  const FavoriteMovieState();
}

class FavoriteMovieInitial extends FavoriteMovieState {}

class FavoriteMovieLoading extends FavoriteMovieState {}

class FavoriteMovieUpdated extends FavoriteMovieState {
  final Set<MovieModel> favoriteMovies;

  const FavoriteMovieUpdated({required this.favoriteMovies});
}
