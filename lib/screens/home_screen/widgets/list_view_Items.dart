// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/screens/details_screen/details_screen.dart';
import 'package:netflix_app/services/get_data_service.dart';
import '../../search_screen/widgets/custom_loading_list_view.dart';
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
      child: FutureBuilder<List<MovieModel>>(
        future: GetHomeDataMovie().getDataMovies(movie: movie),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> moviePosters = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              shrinkWrap: false,
              itemCount: moviePosters.length,
              itemBuilder: (context, index) {
                final MovieModel model = moviePosters[index];
                final posterPath = model.posterPath;
                final id = model.id;

                final posterUrl = 'https://image.tmdb.org/t/p/w500$posterPath';

                final videoUrl =
                    'https://embed.smashystream.com/playere.php?tmdb=$id';

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          videoUrl: videoUrl,
                          movie: model,
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
            return const CustomLoadingListView();
          }
        },
      ),
    );
  }
}
