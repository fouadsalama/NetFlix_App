import 'dart:convert';
import 'package:netflix_app/models/movIe_model.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';

class GetTrendingServices {
  Future<List<MovieModel>> getTrendingAllMovies() async {
    final Uri url = Uri.parse('$baseUrl/trending/all/day?api_key=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> results = jsonData['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception("Error Occurred while fetching data");
    }
  }
}
