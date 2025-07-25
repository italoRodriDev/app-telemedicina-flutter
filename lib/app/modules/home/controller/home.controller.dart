import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isVisibleCommitments = false;
  bool isVisibleTasks = false;
  List<dynamic> dataCommitments = [
    {
      "title": 'Quimioterapia',
      "location": "Hospital Sírio-Libanês",
      "status": "Confirmado"
    },
    {
      "title": 'Dentista',
      "location": "Hospital Israelita Albert Einstein",
      "status": "Em analise"
    },
    {
      "title": 'Fisioterapia',
      "location": "Hospital Alemão Oswaldo Cruz",
      "status": "Em analise"
    },
  ];

  List<dynamic> dataTasks = [
    {"title": 'Quimioterapia', "checked": true},
    {"title": 'Dentista', "checked": false},
    {"title": 'Fisioterapia', "checked": false},
  ];
}
