import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Sections/formation_doctorant.dart';
import 'Sections/learning_travel.dart';
import 'Sections/soft_skills.dart';
import 'Sections/sur_mesures.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({super.key});

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (_) => const SurMesures(),
          ),
          ScrollTransformItem(
            builder: (_) => const SoftSkills(),
          ),
          ScrollTransformItem(
            builder: (_) => const FormationDoctorant(),
          ),
          ScrollTransformItem(
            builder: (_) => const LearningTravel(),
          ),
        ],
      ),
    );
  }
}
