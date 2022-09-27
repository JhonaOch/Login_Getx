
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/modules/splash/splash_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_)=>
       const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
        
      ),
    );
  }
}