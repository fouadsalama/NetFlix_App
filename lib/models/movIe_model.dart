class MoviePosterModel {
  final String posterPath;
  final String title;
  final int id;

  MoviePosterModel(
      {required this.id, required this.title, required this.posterPath});

  factory MoviePosterModel.fromJson(Map<String, dynamic> json) {
    return MoviePosterModel(
      posterPath: json['poster_path'],
      title: json['title'],
      id: json['id'],
    );
  }
}
