import 'package:flutter/material.dart';

import '../../../DataBase/Models/formations.dart';

class FormationSurMesuresInfoPage extends StatefulWidget {
  const FormationSurMesuresInfoPage({super.key});

  @override
  State<FormationSurMesuresInfoPage> createState() =>
      _FormationSurMesuresInfoPageState();
}

class _FormationSurMesuresInfoPageState
    extends State<FormationSurMesuresInfoPage> {
  late Formation formation;
  @override
  void initState() {
    formation = formations[0];
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
