import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';

import '../controller/detail.controller.dart';

class DetailPage extends GetView<DetailController> {
  DetailController ctrl = Get.put(DetailController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return GetBuilder(
        init: ctrl,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: TextComponent(value: 'Detalhes', fontSize: 16),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Icon(Icons.home),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
