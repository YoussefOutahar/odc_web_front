import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/formations.dart';
import '../../../../Services/constants.dart';
import '../../../Components/section_title.dart';
import '../Components/formation_card.dart';

class LearningTravel extends StatelessWidget {
  const LearningTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[1],
            title: "Learning Travel",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs: "* Voyage Programmation Informatique\n\n* Voyage découverte pédagogique \n\n* Voyage entreprenariat",
            press: () {
              Get.toNamed("/formations/learningTravel");
            },
            imageSrc: formations[3].image,
          )
        ],
      ),
    );
  }
}
