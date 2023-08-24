class Movie {
  final List<dynamic> results;

  const Movie({required this.results});
}

class MovieModel extends Movie {
  const MovieModel({
    required super.results,
  });
  factory MovieModel.formJson(Map<String, dynamic> json) {
    return MovieModel(results: json['results']);
  }

  static fromJson(e) {}
}
