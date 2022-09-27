import 'package:flutter_getx_pattern/app/modules/details/details_binding.dart';
import 'package:flutter_getx_pattern/app/modules/details/details_page.dart';
import 'package:flutter_getx_pattern/app/modules/home/home_binding.dart';
import 'package:flutter_getx_pattern/app/modules/home/home_page.dart';
import 'package:flutter_getx_pattern/app/modules/login/login_binding.dart';
import 'package:flutter_getx_pattern/app/modules/login/login_page.dart';
import 'package:flutter_getx_pattern/app/modules/splash/splash_binding.dart';
import 'package:flutter_getx_pattern/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashPage(),
    binding: SplashBinding()),

      GetPage(name: AppRoutes.HOME, page: () => const HomePage(),
    binding: HomeBinding()),

      GetPage(name: AppRoutes.DETAIL, page: () => const DetailPage(),
    binding: DetailBinding()),
        GetPage(name: AppRoutes.LOGIN, page: () => const LoginPage(),
    binding: LoginBinding()),
    
  ];
}
