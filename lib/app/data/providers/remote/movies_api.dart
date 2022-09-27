
import 'package:dio/dio.dart';
import 'package:flutter_getx_pattern/app/data/models/movie.dart';
import 'package:get/instance_manager.dart';

import '../../../utils/constants.dart';

class MovieAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Movie>> getTopMovies() async {
    final Response response = await _dio.get("/movie/top_rated",
        queryParameters: {
          "api_key": Constants.THE_MOVIE_DB_API_KEY,
          "languaje": "es"
        });

    return (response.data['results'] as List)
        .map((e) => Movie.fromJson(e))
        .toList();
  }
}
