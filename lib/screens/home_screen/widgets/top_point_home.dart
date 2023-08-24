import 'package:flutter/material.dart';
import 'package:netflix_app/models/results_model.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_item_home.dart';

class TopPointHomeScreen extends StatefulWidget {
  const TopPointHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TopPointHomeScreen> createState() => _TopPointHomeScreenState();
}

class _TopPointHomeScreenState extends State<TopPointHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LIstViewItem(),
      ],
    );
    // return FutureBuilder<List<ResultsModel>>(
    //   future: NowPlayingService().nowPlaying(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       List<ResultsModel> nowPlay = snapshot.data!;

    //       return SizedBox(
    //         height: (240),
    //         width: double.infinity,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //           shrinkWrap: true,
    //           itemCount: 10,
    //           itemBuilder: (BuildContext context, int index) {
    //             // return LIstViewItem(resultsModel: nowPlay[index]);
    //             return Padding(
    //               padding: const EdgeInsets.only(top: 20, left: 20),
    //               child: Container(
    //                 height: 200,
    //                 width: 140,
    //                 decoration: BoxDecoration(
    //                   image: const DecorationImage(
    //                     fit: BoxFit.fill,
    //                     image: NetworkImage(
    //                         // resultsModel.poster,
    //                         // 'https://image.tmdb.org/t/p/w500${resultsModel.poster}'
    //                         'https://image.tmdb.org/t/p/w500/gPbM0MK8CP8A174rmUwGsADNYKD.jpg'),
    //                   ),
    //                   color: kSecondColor,
    //                   borderRadius: BorderRadius.circular(25),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(
    //           color: kMainColor,
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
