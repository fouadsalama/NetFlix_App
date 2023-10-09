class MovieModel {
  final String posterPath;
  final String title;
  final int id;
  final String backdropPath;
  final dynamic voteAverage;
  final String date;
  final String description;
  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.date,
    required this.description,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      posterPath: json['poster_path'],
      title: json['title'],
      id: json['id'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'],
      date: json['release_date'],
      description: json['overview'],
    );
  }
}
