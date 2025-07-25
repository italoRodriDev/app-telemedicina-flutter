import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_crise/components/avatar.component.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/home/controller/home.controller.dart';
import 'package:telemedicina/app/routers/app_routers.dart';

class HomePage extends GetView<HomeController> {
  HomeController ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ctrl,
        builder: (_) {
          return Scaffold(
              body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 232, 236, 255),
                  Color.fromARGB(255, 153, 240, 255)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(color: Colors.white.withOpacity(0.1)),
              ),
              SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            toolbar(),
                            const SizedBox(height: 8),
                            cardChat(),
                            const SizedBox(height: 8),
                            cardCalendar(),
                            const SizedBox(height: 8),
                            cardSite(),
                            const SizedBox(height: 8),
                            cardCommitments(),
                            const SizedBox(height: 8),
                            cardTasks()
                          ],
                        ),
                      )))
            ],
          ));
        });
  }

  Widget toolbar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: AvatarComponent(
                  imageUrl: 'assets/images/avatar.jpg',
                  radius: 25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextComponent(
                      value: 'Boa noite,',
                      fontWeight: FontWeight.w600,
                      color: AppColor.secondary),
                  TextComponent(
                      value: 'Italo',
                      fontWeight: FontWeight.w600,
                      color: AppColor.secondary,
                      fontSize: 22)
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.call_outlined, color: AppColor.secondary),
                  onPressed: () {}),
              IconButton(
                icon: Icon(Icons.notifications_outlined,
                    color: AppColor.secondary),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cardChat() {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 6))
          ],
          color: AppColor.light,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextComponent(
                  value: 'Chat',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColor.secondary),
              TextComponent(value: 'Tire dúvidas sobre o tratamento')
            ]),
            Column(children: [
              Icon(
                Icons.chat_outlined,
                size: 40,
                color: AppColor.primary,
              )
            ])
          ],
        ));
  }

  Widget cardCalendar() {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            )
          ],
          color: AppColor.light,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextComponent(
                  value: 'Agendar consulta',
                  fontWeight: FontWeight.w700,
                  color: AppColor.secondary,
                  fontSize: 18),
              TextComponent(value: 'Por especialidade e/ou médico')
            ]),
            Column(children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 40,
                color: AppColor.primary,
              )
            ])
          ],
        ));
  }

  Widget cardSite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(top: 20, right: 10),
                width: 240,
                height: 90,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12,
                          spreadRadius: 2,
                          offset: const Offset(0, 6))
                    ],
                    color: AppColor.light,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Image.asset(
                                'assets/images/logo_sus.png',
                                fit: BoxFit.cover,
                                width: 100,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(100)),
                                      border: Border.all(
                                          color: AppColor.primary,
                                          style: BorderStyle.solid)),
                                  child: Icon(Icons.arrow_forward_ios,
                                      size: 16, color: AppColor.primary)))
                        ],
                      ),
                    ],
                  ),
                ))),
        Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(0, 6))
                ],
                color: AppColor.light,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Icon(Icons.heart_broken, color: AppColor.secondary),
                    TextComponent(
                        value: 'Reportar \n sintomas',
                        color: AppColor.secondary,
                        textAlign: TextAlign.center)
                  ],
                ))),
      ],
    );
  }

  Widget cardCommitments() {
    return AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.light,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      spreadRadius: 2,
                      offset: const Offset(0, 6))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppColor.primary,
                            ),
                            TextComponent(
                              value: 'Próximos compromissos',
                              fontWeight: FontWeight.w700,
                              color: AppColor.secondary,
                              fontSize: 16,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            ctrl.isVisibleCommitments =
                                !ctrl.isVisibleCommitments;
                            ctrl.update();
                          },
                          icon: Icon(ctrl.isVisibleCommitments == false
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up_outlined),
                          color: AppColor.secondary,
                        )
                      ],
                    )),
                Divider(
                  height: 1,
                  color: AppColor.medium,
                ),
                Visibility(
                    visible: ctrl.isVisibleCommitments,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.medication,
                                      color: AppColor.primary,
                                    ),
                                    TextComponent(
                                      value: 'Hoje',
                                      fontWeight: FontWeight.w700,
                                    )
                                  ],
                                ),
                                TextComponent(
                                  value: '09:00 hrs',
                                  color: AppColor.secondary,
                                  fontWeight: FontWeight.w800,
                                )
                              ],
                            )),
                        for (var i in ctrl.dataCommitments)
                          Material(
                              child: InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesApp.DETAIL);
                                  },
                                  splashColor: AppColor.primary,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          TextComponent(
                                              value:
                                                  '${i['title']} • Ver detalhes'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextComponent(
                                                value: i['location'],
                                                color: AppColor.secondary,
                                                fontWeight: FontWeight.w700,
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  8)),
                                                      color: AppColor.primary
                                                          .withOpacity(0.2)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: AppColor
                                                                .secondary,
                                                            size: 14),
                                                        TextComponent(
                                                          value: i['status'],
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColor
                                                              .secondary,
                                                          fontSize: 12,
                                                        )
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ))))
                      ],
                    ))
              ],
            )));
  }

  Widget cardTasks() {
    return AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: AppColor.light,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6)),
              ]),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: AppColor.primary,
                          ),
                          TextComponent(
                            value: 'Próximas teleconsultas',
                            fontWeight: FontWeight.w700,
                            color: AppColor.secondary,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          ctrl.isVisibleTasks = !ctrl.isVisibleTasks;
                          ctrl.update();
                        },
                        icon: Icon(ctrl.isVisibleTasks == false
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up_outlined),
                        color: AppColor.secondary,
                      )
                    ],
                  )),
              Divider(
                height: 1,
                color: AppColor.medium,
              ),
              Visibility(
                  visible: ctrl.isVisibleTasks,
                  child: Material(
                    child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            for (var i in ctrl.dataTasks)
                              Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15),
                                              child: Icon(
                                                  Icons.check_circle_outline,
                                                  color: i['checked'] == false
                                                      ? AppColor.medium
                                                      : AppColor.primary
                                                          .withOpacity(0.5))),
                                          const SizedBox(width: 2),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextComponent(
                                                value: i['checked'] == false
                                                    ? 'Confirmar presença'
                                                    : 'Presença confirmada',
                                                fontWeight: FontWeight.w600,
                                                textAlign: TextAlign.justify,
                                                fontSize: 16,
                                              ),
                                              TextComponent(
                                                value: i['title'],
                                                fontWeight: FontWeight.w400,
                                                textAlign: TextAlign.justify,
                                                fontSize: 14,
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )),
                          ],
                        )),
                  ))
            ],
          ),
        ));
  }
}
