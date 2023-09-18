import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
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
          SectionTitle(
            color: kAppColors[1],
            title: LocaleKeys.home_page_title_formations.tr(),
            subTitle: LocaleKeys.home_page_subtitle_formations.tr(),
          ),
          const SizedBox(height: 20 * 1.5),
          Wrap(
            spacing: 20,
            runSpacing: 20 * 2,
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
        ],
      ),
    );
  }
}
