import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/routers/app_routers.dart';

import '../../../config/colors/colors.dart';
import '../../menu/view/components/card_item_menu.component.dart';
import '../controller/profile.controller.dart';
import 'components/card_item_menu_profile.component.dart';
import 'package:flutter_crise/components/avatar.component.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfileController ctrl = Get.put(ProfileController());

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
                        Get.offAndToNamed(RoutesApp.TABS_MENU);
                      }),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: TextComponent(
                        value: 'Perfil', fontSize: 14, color: AppColor.primary),
                  )),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 30),
                        child: Row(
                          children: [
                            AvatarComponent(
                                borderColor: AppColor.primary,
                                imageUrl: 'assets/images/avatar.jpg'),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                TextComponent(
                                    value: 'Matricula: 1234567',
                                    fontSize: 13,
                                    color: AppColor.neutral1),
                              ],
                            )
                          ],
                        )),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CardItemMenuProfileComponent(
                              label: 'Cartão de vacina',
                              description: 'Visualize seu cartão',
                              showBtnUpdate: false,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuProfileComponent(
                              label: 'Endereço',
                              description:
                                  'Av. Epitácio Pessoa, 00, Torre \nJoão Pessoa-PB',
                              showBtnUpdate: true,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuProfileComponent(
                              label: 'Contato',
                              description: '(83) 0000-0000',
                              showBtnUpdate: true,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 20),
                            CardItemMenuProfileComponent(
                              label: 'Exames',
                              description: 'Visualize seu histórico de exames',
                              showBtnUpdate: false,
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
