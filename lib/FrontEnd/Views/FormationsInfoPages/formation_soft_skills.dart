import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';

class FormationSoftSkillsInfoPage extends StatefulWidget {
  const FormationSoftSkillsInfoPage({super.key});

  @override
  State<FormationSoftSkillsInfoPage> createState() =>
      _FormationSoftSkillsInfoPageState();
}

class _FormationSoftSkillsInfoPageState
    extends State<FormationSoftSkillsInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            formation.image,
            width: double.maxFinite,
            height: 400,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            formation.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              formation.category,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
