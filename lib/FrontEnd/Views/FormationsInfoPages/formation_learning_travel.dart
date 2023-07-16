import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';

class FormationLearningTravelInfoPage extends StatefulWidget {
  const FormationLearningTravelInfoPage({super.key});

  @override
  State<FormationLearningTravelInfoPage> createState() =>
      _FormationLearningTravelInfoPageState();
}

class _FormationLearningTravelInfoPageState
    extends State<FormationLearningTravelInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[3];
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
