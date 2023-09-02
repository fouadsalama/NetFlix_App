import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/movIe_model.dart';

class GetHomeDataMovie {
  Future<List<MoviePosterModel>> getDataMovies({required String movie}) async {
    final url = Uri.parse('$kBaseUrl/$movie?api_key=$apiKey');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];

      return results.map((json) => MoviePosterModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch now playing movies');
    }
  }
}
