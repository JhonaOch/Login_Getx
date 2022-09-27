import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/modules/splash/splash_binding.dart';
import 'package:flutter_getx_pattern/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/app/routes/app_pages.dart';
import 'package:flutter_getx_pattern/app/utils/dependency_injection.dart';
import 'package:get/get.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      // initialRoute: A,
      // routes: AppPages(),
     
   
    );
  }
}

