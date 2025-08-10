import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/menu/view/menu.dart';
import 'package:telemedicina/app/modules/profile/view/profile.dart';
import 'package:telemedicina/app/routers/app_routers.dart';

import '../modules/home/view/home.dart';
import '../modules/tabs_controller.dart';

const animation = Transition.circularReveal;
const timeAnimation = 300;

class AppPages {
  static final routes = [
    GetPage(
        name: RoutesApp.TABS_MENU,
        page: () => TabsController(
              selectedColor: AppColor.primary, // Cor quando selecionado
              unselectedColor: AppColor.medium, // Cor quando não selecionado
              backgroundColor: AppColor.background,
              items: [
                TabItemData(
                  icon: 'tab_home.svg',
                  label: 'Início',
                  page: HomePage(),
                ),
                TabItemData(
                  icon: 'tab_questionario.svg',
                  label: 'Questionário',
                  page: Placeholder(color: Colors.yellow),
                ),
                TabItemData(
                  icon: 'tab_biblioteca.svg',
                  label: 'Biblioteca',
                  page: Placeholder(color: Colors.red),
                ),
                TabItemData(
                  icon: 'tab_perfil.svg',
                  label: 'Perfil',
                  page: ProfilePage(),
                ),
              ],
            ),
        transition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 1000),
        preventDuplicates: true),
    GetPage(
      name: RoutesApp.MENU,
      page: () => MenuPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
