import 'package:flutter/material.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/screens/search_screen/widgets/search_view.dart';
import 'package:netflix_app/widgets/custom_text_failed.dart';

import '../../services/get_data_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70 + 26),
          CustomTextFailed(
            hintText: 'Search',
            color: Colors.grey,
            suffixIcon: IconButton(
              onPressed: () {},
              splashColor: Colors.transparent,
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/images/cross-mark.png',
                  color: kSecondColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Top Searches',
            style: TextStyle(
              color: kSecondColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<MoviePosterModel>>(
                future: GetHomeDataMovie().getDataMovies(movie: 'upcoming'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<MoviePosterModel> movieList = snapshot.data!;
                    return ListView.builder(
                        itemCount: movieList.length,
                        itemBuilder: (context, index) {
                          final MoviePosterModel model = movieList[index];

                          final posterPath = model.posterPath;
                          final posterUrl =
                              'https://image.tmdb.org/t/p/w500$posterPath';

                          final title = model.title;
                          return SearchView(
                              posterPath: posterUrl, title: title);
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kMainColor,
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    ));
  }
}
