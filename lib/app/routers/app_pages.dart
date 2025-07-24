import 'package:get/get.dart';
import 'package:telemedicina/app/modules/detail/view/detail.dart';
import 'package:telemedicina/app/routers/app_routers.dart';

import '../modules/home/view/home.dart';
import '../modules/splash/view/splash.dart';

const animation = Transition.circularReveal;
const timeAnimation = 300;

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesApp.SPLASH,
      page: () => SplashPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: RoutesApp.HOME,
      page: () => HomePage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: RoutesApp.DETAIL,
      page: () => DetailPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
