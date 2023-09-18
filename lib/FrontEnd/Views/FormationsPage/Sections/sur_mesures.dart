import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/formations.dart';
import '../../../../Services/constants.dart';
import '../../../Components/section_title.dart';
import '../Components/formation_card.dart';

class SurMesures extends StatelessWidget {
  const SurMesures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[3],
            title: "Sur Mesures",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs:
                "* Pack E-Commerce\n\n* Pack lean management & SIx Sigma\n\n* Pack optimisiation de process\n\n* Pack gestion de projet (PMI)",
            press: () {
              Get.toNamed("/formations/surMesures");
            },
            imageSrc: formations[0].image,
          )
        ],
      ),
    );
  }
}
