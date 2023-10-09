import 'package:bloc/bloc.dart';

import '../../models/movIe_model.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  FavoriteMovieCubit() : super(FavoriteMovieInitial());

  final Set<MovieModel> _favoriteMovies = {};

  Set<MovieModel> get favoriteMovies => _favoriteMovies;

  void toggleFavorite(MovieModel movie) {
    if (_favoriteMovies.contains(movie)) {
      _favoriteMovies.remove(movie);
    } else {
      _favoriteMovies.add(movie);
    }
    emit(FavoriteMovieUpdated(favoriteMovies: _favoriteMovies));
  }
}
