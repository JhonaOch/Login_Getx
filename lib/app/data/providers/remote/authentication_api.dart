
import 'package:dio/dio.dart' ;
import 'package:flutter_getx_pattern/app/data/models/request_token.dart';
import 'package:flutter_getx_pattern/app/utils/constants.dart';
import 'package:get/instance_manager.dart';



class AuthenticationAPI {
  final Dio _dio =Get.find<Dio>();


  Future<RequestToken> newRequestToken() async{

   final Response response=await _dio.get('/authentication/token/new',
    queryParameters:{
      "api_key":Constants.THE_MOVIE_DB_API_KEY
    } );

    return RequestToken.fromJson(response.data);
  }


  Future<RequestToken> validateWithLogin({
    required String username,
    required String password,
    required String requestToken
  }) async{

   final Response response=await _dio.post('/authentication/token/validate_with_login',
    queryParameters:{
      "api_key":Constants.THE_MOVIE_DB_API_KEY,
    },

    data: {
      "username": username,
      "password": password,
      "request_token": requestToken,
    },
    // options: Options(
    //   headers: {}
    // )///Optional

     );

    return RequestToken.fromJson(response.data);
  }


 

  
  
}