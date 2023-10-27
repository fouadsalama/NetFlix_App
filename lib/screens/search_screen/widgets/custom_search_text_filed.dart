import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/movie_search/movie_search_cubit_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        context.read<MovieSearchCubit>().searchMovies(value);
      },
      onSubmitted: (value) {
        BlocProvider.of<MovieSearchCubit>(context).searchMovies(value);
      },
      cursorColor: Theme.of(context).unselectedWidgetColor,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: 'Search for movies...',
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.clear,
            color: Colors.grey,
          ),
          onPressed: () {
            searchController.clear();
            BlocProvider.of<MovieSearchCubit>(context)
                .searchMovies(searchController.text);
          },
        ),
        filled: true,
        fillColor: Theme.of(context).highlightColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 34, vertical: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(45),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
