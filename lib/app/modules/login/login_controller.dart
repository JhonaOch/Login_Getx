import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/data/models/request_token.dart';
import 'package:flutter_getx_pattern/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_getx_pattern/app/data/repositories/remote/authentication_repository.dart';
import 'package:flutter_getx_pattern/app/routes/app_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();

      final LocalAuthRepository _localAuthrepository =
      Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUsernameChange(String text) {
    _username = text;
  }

  void onPasswordChange(String text) {
    _password = text;
  }

  Future<void> submit() async {
    try {
      RequestToken requestToken = await _authenticationRepository.newRequestToken();

      final RequestToken authRequestToken = await _authenticationRepository.authWithLogin(
          username: _username,
          password: _password,
          requestToken: requestToken.requestToken);
      // print("Login OK${authRequestToken.expiresAt}");
      //RequestToken.fromJson(request.request);
      await _localAuthrepository.setSession(authRequestToken);
      Get.offNamed(AppRoutes.HOME);

    } catch (e) {
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
