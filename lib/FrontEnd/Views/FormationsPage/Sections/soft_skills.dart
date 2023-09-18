import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/formations.dart';
import '../../../../Services/constants.dart';
import '../../../Components/section_title.dart';
import '../Components/formation_card.dart';

class SoftSkills extends StatelessWidget {
  const SoftSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[2],
            title: "Soft Skills",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs: "* Certificat PNL\n\n* Prise de decision\n\n* Innovation et business\n\n* Santé social et bien être",
            press: () {
              Get.toNamed("/formations/softSkills");
            },
            imageSrc: formations[1].image,
          )
        ],
      ),
    );
  }
}
