import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants/constants.dart';

class MovieSearchCubit extends Cubit<List<dynamic>> {
  MovieSearchCubit() : super([]);

  Future<void> searchMovies(String query) async {
    final url = Uri.parse('$baseUrl/search/movie?api_key=$apiKey&query=$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      emit(data['results']);
    } else {
      emit([]);
    }
  }
}
