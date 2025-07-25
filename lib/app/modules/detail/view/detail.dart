import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/button.component.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/detail/view/components/double_select.dart';

import '../controller/detail.controller.dart';

class DetailPage extends GetView<DetailController> {
  DetailController ctrl = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: TextComponent(
                value: 'Detalhes',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(left: 22, right: 22),
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: AppColor.medium,
                  ),
                  const SizedBox(height: 8),
                  cardTitle(),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.timer_outlined,
                      title: '07:00',
                      description: 'Terça-feira, 11 de janeiro de 2022'),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.person_2_outlined,
                      title: 'Dr. Italo Rodrigues',
                      description: 'Oncologista'),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.chat_outlined,
                      title: 'Local',
                      description: 'Hospital Sírio-Libanês'),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.bookmark_outline_outlined,
                      title: 'Agendado por',
                      description: 'Aplicativo'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_month_outlined,
                              size: 24, color: AppColor.secondary),
                          TextComponent(
                            value: 'Status',
                            color: AppColor.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: AppColor.medium.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(2)),
                          child: Padding(
                              padding: EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    size: 15,
                                    color: AppColor.secondary,
                                  ),
                                  TextComponent(
                                      value: ' Agendado',
                                      color: AppColor.secondary,
                                      fontWeight: FontWeight.w800)
                                ],
                              )))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        value: 'Confirmar presença?',
                        color: AppColor.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          DoubleSelectComponent(
                              labelBtnOne: 'Sim',
                              labelBtnTwe: 'Não',
                              colorSelected: AppColor.secondary,
                              colorUnselected: AppColor.light,
                              colorLabelUnselected: AppColor.secondary,
                              colorLabelSelected: AppColor.light,
                              onPressedBtnOne: () {},
                              onPressedBtnTwe: () {},
                              borderRadius: 16)
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.timelapse_rounded,
                      title: 'Status da autorização',
                      description: 'Aguardando autorização'),
                  const SizedBox(height: 8),
                  cardInfo(
                      icon: Icons.chat_bubble_outline,
                      title: 'Tele consulta Hospital H1',
                      description: 'Aguardando autorização'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(right: 20, left: 20),
                              child: ButtonComponent(
                                  color: AppColor.primary,
                                  onPressed: () {},
                                  padding: const EdgeInsets.all(10),
                                  borderRadius: 16,
                                  label: 'Iniciar teleconsulta')))
                    ],
                  )
                ],
              ),
            )),
          );
        });
  }
}

Widget cardTitle() {
  return Row(
    children: [
      Column(
        children: [
          Icon(Icons.medication_outlined, size: 24, color: AppColor.secondary)
        ],
      ),
      Column(
        children: [
          TextComponent(
              value: 'Quimio Terapia',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.secondary)
        ],
      )
    ],
  );
}

Widget cardInfo(
    {required IconData icon,
    required String title,
    required String description}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Column(
            children: [Icon(icon, size: 24, color: AppColor.secondary)],
          ),
          Column(
            children: [
              TextComponent(
                  value: title,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.secondary)
            ],
          )
        ],
      ),
      Padding(
          padding: const EdgeInsets.only(left: 25),
          child: TextComponent(value: description, fontSize: 14))
    ],
  );
}
