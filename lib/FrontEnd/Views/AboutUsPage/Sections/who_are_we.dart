import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';

class WhoAreWe extends StatelessWidget {
  const WhoAreWe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_who_are_we.tr(),
              subTitle: "",
              color: Colors.blueGrey),
          const SizedBox(height: 20 * 3),
          const Text(
            "OptimaDecision Consulting (ODC) est une entreprise marocaine spécialisée dans l'optimisation et l’amélioration de la Supply Chain. Nous proposons une gamme complète de services : l’optimisation et l'ingénierie de la chaîne logistique, la simulation des différents maillons de la Supply Chain, les méthodes de  Lean Management, l'accompagnement des entreprises dans l'obtention des divers certifications ISO et la création des Labels. "
            "Nous effectuons, également, des audits de la Supply Chain pour nos clients afin de les aider à identifier les opportunités d'amélioration et à mettre en place des plans d'action pour l’obtention leurs objectifs ainsi que des formations dans les métiers de la chaîne logistique."
            "Notre conviction est que la Supply Chain représente un élément clé de la stratégie de toute entreprise pour laquelle une gestion efficace et efficiente a un impact significatif sur sa performance globale. Notre expertise et notre savoir-faire sont mis à la disposition de nos clients pour les aider à atteindre la performance optimale via création des outils d’aide à la décision."
            "Notre approche unique et notre engagement à fournir un service de haute qualité permettront à nos clients de réaliser des résultats exceptionnels. ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}
