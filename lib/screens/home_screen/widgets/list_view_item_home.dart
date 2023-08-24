import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/home_cubit.dart';
import 'package:netflix_app/models/results_model.dart';
import 'package:netflix_app/services/get_now_playing_service.dart';
import '../../../constants/constants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

MovieModel? movie;

class LIstViewItem extends StatelessWidget {
  const LIstViewItem({
    super.key, required this.movieModel,
  });
final MovieModel? movieModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230,
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final HomeCubit cubit = HomeCubit.get(context);
            return ConditionalBuilder(
                condition: state is GetDataSuccess,
                builder: (context)=>ListView.builder(
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
                          image:  DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${movieModel?.results[index]['poster_path']}',
                            ),
                          ),
                          color: kSecondColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    );
                  },
                ),
                fallback: (context)=>const CircularProgressIndicator());
          },
        )
    );
  }
}
