

import 'dart:convert';

import 'package:flutter_getx_pattern/app/data/models/request_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth{
  // ignore: constant_identifier_names
  static const KEY="session";

  final FlutterSecureStorage _storage= Get.find<FlutterSecureStorage>();


  Future<void> setSession(RequestToken requestToken) async{
    await _storage.write(key: KEY, value: jsonEncode(requestToken.toJson()));

  }

   Future<void> clearSession() async{
    await _storage.delete(key: KEY);

  }

   Future<RequestToken?> getSession() async{
   final String data =await _storage.read(key: KEY) as String;
   // ignore: unnecessary_null_comparison
   if(data != null){
    final RequestToken request= RequestToken.fromJson(jsonDecode(data));

    if(DateTime.now().isBefore(request.expiresAt)){
      return request;

    }
    return null;
   }

   return null;
  

  }


}