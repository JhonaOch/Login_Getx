

import 'package:flutter_getx_pattern/app/data/models/request_token.dart';
import 'package:flutter_getx_pattern/app/data/repositories/local/local_auth_repository.dart';
import 'package:flutter_getx_pattern/app/routes/app_routes.dart';
import 'package:get/get.dart';


class SplashController extends GetxController{
final LocalAuthRepository _localAuthrepository= Get.find<LocalAuthRepository>();
  
  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async{

    try {
      final RequestToken? requestToken= await _localAuthrepository.session;
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(
        requestToken!= null? AppRoutes.HOME:AppRoutes.LOGIN);
    }catch(e){
      // ignore: avoid_print
      print(e);

    }

   


  }


}