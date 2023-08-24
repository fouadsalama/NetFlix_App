import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/cubits/home_cubit.dart';
import 'package:netflix_app/screens/home_screen/widgets/headline_home.dart';
import 'package:netflix_app/screens/home_screen/widgets/list_view_item_home.dart';
import '../../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'Home_Screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getResults(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  CustomAppBar(),
                  HeadlinesScreen(text: 'Now Playing'),
                  LIstViewItem(movieModel: cubit.movieModel,),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}
