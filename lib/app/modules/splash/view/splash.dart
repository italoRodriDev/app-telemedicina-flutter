import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/colors.dart';
import '../controller/splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  SplashController ctrl = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColor.light,
              body: SafeArea(
                  child: Center(
                child: Container(
                  child: Image.asset('assets/images/logo_sus.png', width: 150),
                ),
              )));
        });
  }
}
