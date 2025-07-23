import 'package:get/get.dart';

import '../modules/home/view/home.dart';
import '../modules/splash/view/splash.dart';
import 'app_routers.dart';

const animation = Transition.circularReveal;
const timeAnimation = 300;

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
