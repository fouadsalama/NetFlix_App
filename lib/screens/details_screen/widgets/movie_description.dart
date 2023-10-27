import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
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
            movie.description,
            maxLines: 5,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          ),
        ),
      ],
    );
  }
}
