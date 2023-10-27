import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/constants/constants.dart';
import 'package:netflix_app/cubits/movie_search/movie_search_cubit_cubit.dart';
import 'package:netflix_app/helper/lunch_url.dart';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:netflix_app/services/get_data_service.dart';
import 'widgets/custom_of_search_empty.dart';
import 'widgets/custom_search_text_filed.dart';
import 'widgets/display_image_search_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return BlocProvider(
      create: (context) => MovieSearchCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: BlocBuilder<MovieSearchCubit, List<dynamic>>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70 + 26),
                CustomSearchTextField(
                  searchController: searchController,
                ),
                Expanded(
                  child: BlocBuilder<MovieSearchCubit, List<dynamic>>(
                    builder: (context, searchResults) {
                      if (searchResults.isEmpty) {
                        return FutureBuilder<List<MovieModel>>(
                            future: GetHomeDataMovie()
                                .getDataMovies(movie: 'popular'),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<MovieModel> movieList = snapshot.data!;
                                return ListOfSearchEmpty(movieList: movieList);
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: kMainColor,
                                ));
                              }
                            });
                      } else {
                        return ListView.builder(
                          physics: const ScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          itemCount: searchResults.length,
                          itemBuilder: (context, index) {
                            final movie = searchResults[index];
                            return GestureDetector(
                              onTap: () {
                                final id = movie['id'];

                                final videoUrl =
                                    'https://embed.smashystream.com/playere.php?tmdb=$id';
                                lunchUrl(videoUrl: videoUrl);
                              },
                              child: Row(
                                children: [
                                  SearchPoster(movie: movie),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie['title'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Release Date: ${movie['release_date']}',
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
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
