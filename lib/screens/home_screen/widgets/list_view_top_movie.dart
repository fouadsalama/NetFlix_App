import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../helper/list_home_item_builder.dart';
import '../../../models/movIe_model.dart';
import '../../../services/get_data_service.dart';
import 'display_image.dart';

class ListViewTopMovie extends StatelessWidget {
  const ListViewTopMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: FutureBuilder<List<MoviePosterModel>>(
            future: GetHomeDataMovie().getDataMovies(movie: 'top_rated'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MoviePosterModel> moviePosters = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: moviePosters.length,
                  itemBuilder: (context, index) {
                    final posterUrl = listItemBuilder(moviePosters, index);
                    return DisplayImage(
                      posterUrl: posterUrl,
                    );
                  },
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: kMainColor,
                ));
              }
            }),
      ),
    );
  }
}
