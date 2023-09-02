// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:netflix_app/models/results_model.dart';
// import 'package:netflix_app/services/get_trending_service.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   MovieModel? movieModel;
//   final NowPlayingService nowPlayingService = NowPlayingService();
//   static HomeCubit get(context) => BlocProvider.of(context);

//   getResults() async {
//     emit(GetDataInitial());
//     final results = await nowPlayingService.getTrendingAllMovies();

//     movieModel = results;
//     emit(GetDataSuccess());
//   }
// }
