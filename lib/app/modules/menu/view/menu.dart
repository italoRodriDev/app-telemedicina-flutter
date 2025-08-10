import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/menu/view/components/card_item_menu.component.dart';

import '../controller/menu.controller.dart';

class MenuPage extends GetView<MenuOptionsController> {
  MenuOptionsController ctrl = Get.put(MenuOptionsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          size: 20, color: AppColor.primary),
                      onPressed: () {
                        Get.back();
                      }),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: TextComponent(
                        value: 'Menu', fontSize: 14, color: AppColor.primary),
                  )),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextComponent(
                                value: 'Nome',
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColor.primary),
                            TextComponent(
                                value: 'Completo',
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: AppColor.primary),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CardItemMenuComponent(
                              label: 'Perfil',
                              description: 'Meus dados e documentações',
                              icon: 'perfil.svg',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuComponent(
                              label: 'FAQ',
                              description: 'Dúvidas sobre o app',
                              icon: 'chat.svg',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuComponent(
                              label: 'Pontuação',
                              description: 'Minhas pontuações',
                              icon: 'pontos.svg',
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuComponent(
                              label: 'Sair',
                              description: '',
                              icon: 'sair.svg',
                              onPressed: () {},
                            ),
                          ],
                        ))
                  ],
                ),
              )));
        });
  }
}
