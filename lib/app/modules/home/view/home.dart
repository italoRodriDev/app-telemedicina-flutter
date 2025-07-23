import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_crise/components/avatar.component.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';
import 'package:telemedicina/app/config/colors/colors.dart';
import 'package:telemedicina/app/modules/home/controller/home.controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.all(8),
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
                      cardCompromissos(),
                      const SizedBox(height: 8),
                      cardTasks()
                    ],
                  ),
                )))
      ],
    ));
  }
}

Widget toolbar() {
  return Container(
    padding: EdgeInsets.all(8),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: AvatarComponent(
                imageUrl:
                    'https://img.freepik.com/fotos-premium/emoji-de-memoji-de-homem-sorrindo-e-bonito-em-fundo-branco_826801-6987.jpg?semt=ais_hybrid&w=740',
                radius: 25,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(value: 'Boa noite,'),
                TextComponent(
                    value: 'Maria Luisa',
                    fontWeight: FontWeight.w600,
                    fontSize: 22)
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_outlined))
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
              offset: Offset(0, 6))
        ],
        color: AppColor.light,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextComponent(
                value: 'Chat', fontWeight: FontWeight.w700, fontSize: 18),
            TextComponent(value: 'Tire dúvidas sobre o tratamento')
          ]),
          Column(children: [
            Icon(
              Icons.chat_bubble,
              size: 55,
              color: AppColor.orange,
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
            offset: Offset(0, 6),
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
                fontSize: 18),
            TextComponent(value: 'Por especialidade e/ou médico')
          ]),
          Column(children: [
            Icon(
              Icons.calendar_month,
              size: 55,
              color: AppColor.orange,
            )
          ])
        ],
      ));
}

Widget cardSite() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          padding: EdgeInsets.only(top: 20),
          width: 240,
          height: 90,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 6))
              ],
              color: AppColor.light,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: Image.network(
                          'https://whatthelogo.com/storage/logos/sus-sistema-unico-de-saude-150729.png',
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                border: Border.all(
                                    color: AppColor.blue,
                                    style: BorderStyle.solid)),
                            child: Icon(Icons.arrow_forward_ios,
                                size: 16, color: AppColor.blue)))
                  ],
                ),
              ],
            ),
          )),
      Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 6))
              ],
              color: AppColor.light,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Icon(Icons.heart_broken),
                  TextComponent(
                      value: 'Reportar \n sintomas',
                      textAlign: TextAlign.center)
                ],
              ))),
    ],
  );
}

Widget cardCompromissos() {
  return Container(
      decoration: BoxDecoration(
          color: AppColor.light,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                spreadRadius: 2,
                offset: Offset(0, 6))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.green),
                      TextComponent(
                        value: 'Próximos compromissos',
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              )),
          Divider(
            height: 1,
            color: AppColor.medium,
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.medication,
                        color: Colors.green,
                      ),
                      TextComponent(
                        value: 'Hoje',
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                  TextComponent(
                    value: '09:00',
                    fontWeight: FontWeight.w600,
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextComponent(value: 'Quimioterapia • Detalhe'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(value: 'Hospital H1'),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: Colors.green.withOpacity(0.2)),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                TextComponent(
                                  value: 'Confirmado',
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ))
        ],
      ));
}

Widget cardTasks() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: AppColor.light,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 2,
              offset: Offset(0, 6)),
        ]),
    child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month, color: Colors.green),
                        TextComponent(
                          value: 'Tarefas a concluir',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )),
            Divider(
              height: 1,
              color: AppColor.medium,
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Icon(Icons.check_circle_outline,
                                color: AppColor.medium)),
                        const SizedBox(width: 2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextComponent(
                              value: 'Confirmar presença',
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.justify,
                              fontSize: 16,
                            ),
                            TextComponent(
                              value: 'Quimioterapia',
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
  );
}
