

import 'package:flutter_getx_pattern/app/data/providers/remote/movies_api.dart';
import 'package:get/get.dart';

import '../../models/movie.dart';

class MoviesRepository {
 final MovieAPI _api = Get.find<MovieAPI>();


 Future<List<Movie>> getTopMoviesRepository() => _api.getTopMovies();


}