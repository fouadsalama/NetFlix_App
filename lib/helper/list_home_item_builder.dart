import '../models/movIe_model.dart';

listItemBuilder(List<MoviePosterModel> movies, int index) {
  final MoviePosterModel model = movies[index];
  final posterPath = model.posterPath;
  final posterUrl = 'https://image.tmdb.org/t/p/w500$posterPath';
  return posterUrl;
}
