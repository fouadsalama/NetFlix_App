import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/screens/details_screen/details_screen.dart';
import 'package:netflix_app/services/get_data_service.dart';
import '../../../constants/constants.dart';
import 'display_image.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({
    super.key,
    required this.movie,
  });
  final String movie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: FutureBuilder<List<MoviePosterModel>>(
          future: GetHomeDataMovie().getDataMovies(movie: movie),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MoviePosterModel> moviePosters = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: moviePosters.length,
                itemBuilder: (context, index) {
                  final MoviePosterModel model = moviePosters[index];
                  final posterPath = model.posterPath;
                  final backdropPath = model.backdropPath;
                  final id = model.id;
                  final title = model.title;
                  final rating = model.voteAverage;
                  final year = model.date;
                  final description = model.description;
                  final backdropUrl =
                      'https://image.tmdb.org/t/p/w500$backdropPath';
                  final posterUrl =
                      'https://image.tmdb.org/t/p/w500$posterPath';

                  final videoUrl =
                      'https://embed.smashystream.com/playere.php?tmdb=$id';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  backdropPath: backdropUrl,
                                  title: title,
                                  rate: rating,
                                  time: year,
                                  desc: description,
                                  videoUrl: videoUrl,
                                )),
                      );
                    },
                    child: DisplayImage(
                      posterUrl: posterUrl,
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: kMainColor,
                ),
              );
            }
          }),
    );
  }
}
