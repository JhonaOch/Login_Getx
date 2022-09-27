import 'package:flutter_getx_pattern/app/data/models/request_token.dart';
import 'package:flutter_getx_pattern/app/data/providers/remote/authentication_api.dart';
import 'package:get/get.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();
  Future<RequestToken> authWithLogin(
          {required String username,
          required String password,
          required String requestToken}) =>
      _api.validateWithLogin(
          username: username, password: password, requestToken: requestToken);
}
