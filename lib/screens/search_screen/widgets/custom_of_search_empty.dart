import 'package:flutter/material.dart';

import '../../../helper/lunch_url.dart';
import '../../../models/movIe_model.dart';

class ListOfSearchEmpty extends StatelessWidget {
  const ListOfSearchEmpty({
    super.key,
    required this.movieList,
  });

  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        final MovieModel movie = movieList[index];
        final posterPath = movie.posterPath;
        final posterUrl = 'https://image.tmdb.org/t/p/w500$posterPath';
        return GestureDetector(
          onTap: () {
            final id = movie.id;

            final videoUrl =
                'https://embed.smashystream.com/playere.php?tmdb=$id';
            lunchUrl(videoUrl: videoUrl);
          },
          child: Row(
            children: [
              Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      posterUrl,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Release Date: ${movie.date}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
