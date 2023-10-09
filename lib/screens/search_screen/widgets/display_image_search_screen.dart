import 'package:flutter/material.dart';

class SearchPoster extends StatelessWidget {
  const SearchPoster({
    super.key,
    required this.movie,
  });

  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    if (movie['poster_path'] != null && movie['poster_path']!.isNotEmpty) {
      return Container(
        height: 100,
        width: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w500${movie['poster_path']}",
            ),
          ),
        ),
      );
    } else {
      return const SizedBox(
        width: 50,
        height: 100,
      );
    }
  }
}
