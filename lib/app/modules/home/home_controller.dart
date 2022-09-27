import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/data/models/movie.dart';
import 'package:flutter_getx_pattern/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_getx_pattern/app/data/repositories/remote/movies_repository.dart';
import 'package:flutter_getx_pattern/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();
  final MoviesRepository _moviesRepository =Get.find<MoviesRepository>();

  List<Movie> _movies=[];

  List<Movie> get movies=> _movies;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();

    Get.offNamedUntil(AppRoutes.LOGIN, (route) => false);
  }

  @override
  void onReady() {
    super.onReady();
    loadMoviesRated();

  }


  Future<void> loadMoviesRated() async {
    try {
      _movies= await _moviesRepository.getTopMoviesRepository();
      // ignore: avoid_print
      print(_movies.length);
      update();
    }catch (e) {
      // ignore: avoid_print
      print(e);
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response!.statusMessage as String;
        } else {
          message = e.message;
        }
      }

      Get.dialog(AlertDialog(
        title: const Text("ERROR"),
        content: Text(message),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK"))
        ],
      ));

    }
   

  }
}
