import 'package:flutter/material.dart';
import 'package:netflix_app/models/results_model.dart';
import 'package:netflix_app/services/get_now_playing_service.dart';
import '../../../constants/constants.dart';

MovieModel? movie;

class LIstViewItem extends StatelessWidget {
  const LIstViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: FutureBuilder<List<MovieModel>>(
          future: NowPlayingService().getNowPlayingMovies(),
          builder: (context, snapshot) {
            print('snapshot ${snapshot}');
            return ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  child: Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/gPbM0MK8CP8A174rmUwGsADNYKD.jpg',
                        ),
                      ),
                      color: kSecondColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
