class MoviePosterModel {
  final String posterPath;
  final String title;

  MoviePosterModel({required this.title, required this.posterPath});

  factory MoviePosterModel.fromJson(Map<String, dynamic> json) {
    return MoviePosterModel(
      posterPath: json['poster_path'],
      title: json['title'],
    );
  }
}
