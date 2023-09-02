import 'package:flutter/material.dart';
import 'package:netflix_app/helper/list_home_item_builder.dart';

import '../../../constants/constants.dart';
import '../../../models/movIe_model.dart';
import '../../../services/get_data_service.dart';
import 'display_image.dart';

class ListViewPopularMovie extends StatelessWidget {
  const ListViewPopularMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: FutureBuilder<List<MoviePosterModel>>(
        future: GetHomeDataMovie().getDataMovies(movie: 'upcoming'),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final List<MoviePosterModel> moviePosters = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: moviePosters.length,
              itemBuilder: (context, index) {
                final posterUrl = listItemBuilder(moviePosters, index);
                return DisplayImage(posterUrl: posterUrl);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
        },
      ),
    );
  }
}
