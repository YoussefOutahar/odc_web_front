import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/formations.dart';
import '../../../../Services/constants.dart';
import '../../../Components/section_title.dart';
import '../Components/formation_card.dart';

class FormationDoctorant extends StatelessWidget {
  const FormationDoctorant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[0],
            title: "Formations Doctorants",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs:
                "* Boîte à outils recherche scientifique\n\n* Boîte à outils Enseignement supérieur et pédagogie\n\n* Boîte à outils Méthodologie & encadrement",
            press: () {
              Get.toNamed("/formations/doctorant");
            },
            imageSrc: formations[2].image,
          )
        ],
      ),
    );
  }
}
