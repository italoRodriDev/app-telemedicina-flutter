import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/home/controller/home.controller.dart';
import 'package:telemedicina/app/modules/home/view/components/list_menu_home.component.dart';
import 'package:telemedicina/app/modules/menu/view/menu.dart';

import 'components/toolbar_home.component.dart';

class HomePage extends GetView<HomeController> {
  HomeController ctrl = Get.put(HomeController());
  int coins = 50;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (_) {
          return Scaffold(
              body: SafeArea(
                  child: SingleChildScrollView(
            child: Column(
              children: [
                ToolbarHomeComponent(
                    onPressedMenu: () {
                      showMenu(context);
                    },
                    onPressedCheckIn: () {}),
                const SizedBox(height: 10),
                const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: AnimatedCardsList())
              ],
            ),
          )));
        });
  }

  Widget card(
      {required String icon,
      required String label,
      required Function onPressed}) {
    return InkWell(
        onTap: () => onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Card(
          elevation: 0,
          color: AppColor.neutral2,
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/images/${icon}', width: 22),
                    const SizedBox(width: 20),
                    TextComponent(
                        value: label,
                        fontWeight: FontWeight.w600,
                        color: AppColor.neutral1,
                        fontSize: 16),
                  ],
                ),
                Icon(Icons.arrow_forward_ios,
                    color: AppColor.neutral1, size: 16)
              ],
            ),
          ),
        ));
  }

  showMenu(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return MenuPage();
      },
    );
  }
}
