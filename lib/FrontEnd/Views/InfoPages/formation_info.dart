import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../DataBase/Models/formations.dart';

class FormationInfoPage extends StatefulWidget {
  const FormationInfoPage({super.key});

  @override
  State<FormationInfoPage> createState() => _FormationInfoPageState();
}

class _FormationInfoPageState extends State<FormationInfoPage> {
  late Formation formation;
  late int formationId;

  @override
  void initState() {
    formationId = 5;

    Get.parameters['id'] != null
        ? formationId = int.parse(Get.parameters['id']!)
        : formationId = 5;

    formation = Formation(category: 'test', image: 'est', title: 'test');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(formationId.toString()));
  }
}
