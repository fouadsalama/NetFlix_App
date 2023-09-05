import 'package:flutter/material.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/services/get_data_service.dart';
import '../../../constants/constants.dart';
import '../../../helper/list_home_item_builder.dart';
import 'display_image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
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
                  ),
                );
              }
            }),
      ),
    );
  }
}
