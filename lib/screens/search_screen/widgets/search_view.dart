import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    required this.posterPath,
    required this.title,
  });

  final posterPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 100,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(posterPath),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: kSecondColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  ' Movies',
                  style: TextStyle(
                    color: Color(0xff666A71),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
