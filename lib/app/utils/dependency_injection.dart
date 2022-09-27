import 'package:dio/dio.dart';
import 'package:flutter_getx_pattern/app/data/providers/local/local_auth.dart';
import 'package:flutter_getx_pattern/app/data/providers/remote/authentication_api.dart';
import 'package:flutter_getx_pattern/app/data/providers/remote/movies_api.dart';
import 'package:flutter_getx_pattern/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_getx_pattern/app/data/repositories/remote/authentication_repository.dart';
import 'package:flutter_getx_pattern/app/data/repositories/remote/movies_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {

    ///LazyPut elimina instancias de memoria
    ///fenix crea una nueva instancia
    ///Put matiene todos los datos en memoria
    Get.lazyPut<FlutterSecureStorage>(() => const FlutterSecureStorage(),fenix: true);
    Get.lazyPut<Dio>(
        () => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3')),fenix: true,
        );

      

    // ignore: todo
    //TODO Providers
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI(),fenix: true);
    Get.lazyPut<LocalAuth>(() => LocalAuth(),fenix: true);
    Get.lazyPut<MovieAPI>(() => MovieAPI(),fenix: true);

    // ignore: todo
    //TODO Repositories
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(),fenix: true);
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(),fenix: true);
    Get.lazyPut<MoviesRepository>(() => MoviesRepository(),fenix: true);
  }
}
