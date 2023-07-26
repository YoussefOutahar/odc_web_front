import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/formations.dart';
import '../Components/formation_card.dart';

class Formations extends StatelessWidget {
  const Formations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionTitle(
            title: "Formations",
            subTitle: "Nos formations",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: 20 * 1.5),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: List.generate(
              formations.length,
              (index) => FormationCard(
                formation: formations[index],
                press: () {
                  switch (index) {
                    case 0:
                      Get.toNamed("/formations/surMesures");
                      break;
                    case 1:
                      Get.toNamed("/formations/softSkills");
                      break;
                    case 2:
                      Get.toNamed("/formations/doctorant");
                      break;
                    case 3:
                      Get.toNamed("/formations/learningTravel");
                      break;
                    default:
                  }
                },
              ),
            ),
          ),
          // Wrap(
          //   spacing: 20,
          //   runSpacing: 20 * 2,
          //   children: List.generate(
          //     formations.length,
          //     (index) => FormationCard(
          //       formation: formations[index],
          //       press: () {
          //         switch (index) {
          //           case 0:
          //             Get.toNamed("/formations/surMesures");
          //             break;
          //           case 1:
          //             Get.toNamed("/formations/softSkills");
          //             break;
          //           case 2:
          //             Get.toNamed("/formations/doctorant");
          //             break;
          //           case 3:
          //             Get.toNamed("/formations/learningTravel");
          //             break;
          //           default:
          //         }
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
