

import 'package:flutter_getx_pattern/app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LoginController());
  }


}