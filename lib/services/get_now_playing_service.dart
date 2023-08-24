import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_app/helper/api.dart';
import 'package:netflix_app/models/results_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
}

class NowPlayingService {
  String baseUrl = 'https://api.themoviedb.org/3/movie';
  String apiKey = 'b18d712e84b672f268f26229271fd13e';

  Future<List<MovieModel>> getNowPlayingMovies() async {
    Uri url = Uri.parse('$baseUrl/now_playing?api_key=$apiKey');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.body as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw Exception('Failed to load now playing movies.');
    }
    // Map<String, dynamic> data = jsonDecode(response.body);

    // ResultsModel result = ResultsModel.fromJson(data);

    // return result;
  }

  // @override
  // Future<List<MovieModel>> getNowPlayingMovies() async {
  //   // Uri url = Uri.parse('$baseUrl/now_playing?api_key=$apiKey');

  //   // http.Response response = await http.get(url);
  //   Map<String, dynamic> data = await Api().get(
  //     url: '$baseUrl/now_playing?api_key=$apiKey',
  //   );
  //   var movieList = <List<MovieModel>>{};
  //   for (int i = 0; i < data.length; i++) {
  //     print('i:$i');
  //     print('data:${data[i]}');
  //   }
  //   // return movieList;
  //   return movieList;
  // }
  // if (response.statusCode == 200) {
  //   List<dynamic> results = jsonDecode(response.body)["results"];
  //
  //   var map = <String, dynamic>{};
  //   for (var i in results) {
  //     print("i is ${i['poster_path']}");

  //     map['posterPath'] = i["poster_path"];
  //   }

  //   print(map['posterPath']);
  //   print(movieList);

  // return map;

  // @override
  // Future<List<MovieModel>> getNowPlayingMovies() async {
  //   final response = await Dio().get(
  //       'https://api.themoviedb.org/3/movie/now_playing?api_key=b18d712e84b672f268f26229271fd13e');
  //   if (response.statusCode == 200) {

  //     return List<MovieModel>.from((response.data["results"] as List).map(
  //       (e) => MovieModel.fromJson(e),

  //     ));

  //   } else {
  //     throw Exception('Failed to load now playing movies.');
  //   }
  // }
}
