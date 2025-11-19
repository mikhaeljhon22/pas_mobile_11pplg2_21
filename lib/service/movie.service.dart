import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_21/model/movie.model.dart';

class MovieService {
  final String url = "https://api.tvmaze.com/shows";

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => MovieModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
