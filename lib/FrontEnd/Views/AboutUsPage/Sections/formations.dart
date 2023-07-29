import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';
import '../Components/about_us_text.dart';

class Formations extends StatelessWidget {
  const Formations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_formations.tr(),
              subTitle: "",
              color: Colors.blueGrey),
          const AboutUsText(
            text:
                "Découvrez notre entreprise, votre partenaire privilégié pour votre développement personnel et professionnel. Notre vaste gamme de formations comprend des solutions sur mesure, des programmes de renforcement des soft skills, des formations spécialisées pour les doctorants et même des expériences uniques de voyage et d'apprentissage. Que vous souhaitiez renforcer vos compétences techniques, améliorer votre communication interpersonnelle, approfondir vos connaissances académiques ou vivre une expérience d'apprentissage immersive, nous avons tout ce dont vous avez besoin. Nos formateurs qualifiés et expérimentés vous guideront dans votre parcours de formation, en vous offrant des cours pertinents, interactifs et adaptés à vos besoins spécifiques. Investissez dans votre croissance professionnelle avec nous et ouvrez-vous à un monde de possibilités",
          ),
        ],
      ),
    );
  }
}
