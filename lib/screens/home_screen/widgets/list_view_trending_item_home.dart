import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/screens/video_screen/video_screen.dart';
import 'package:netflix_app/services/get_data_service.dart';
import '../../../constants/constants.dart';
import 'display_image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: FutureBuilder<List<MoviePosterModel>>(
          future: GetHomeDataMovie().getDataMovies(movie: 'popular'),
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
                  final posterUrl =
                      'https://image.tmdb.org/t/p/w500$posterPath';

                  final id = model.id;
                  final videosUrl =
                      'https://embed.smashystream.com/playere.php?tmdb=$id';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            url: videosUrl,
                          ),
                        ),
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
