import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';
import '../Components/about_us_text.dart';
import '../Components/about_us_title.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_what_we_do.tr(),
              subTitle: "",
              color: Colors.blueGrey),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "SCM & Smart Système",
          ),
          const AboutUsText(
            text:
                "Optimisation et amélioration de la Supply Chain (Achats, Approvisionnement, Production, Distribution et logistique de retour)\n\nAudit logistique (Supply Chain Master, SCOR(APICS))\n\nInstauration du Lean Management\n\nSolution IT adaptée et sur-mesure ",
          ),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "Certification ISO",
          ),
          const AboutUsText(
            text:
                "Audit d’évaluation de la maturité SMQ de l’organisation\n\nRéalisation/Correction du manuel qualité\n\nFormation au système management de la qualité\n\nTableau de bord ISO",
          ),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "Energie & exploitation énergétique",
          ),
          const AboutUsText(
            text:
                "Optimisation de l’exploitation énergétique dans les bâtiments \n\nAudit énergétique\n\nAmélioration du confort thermique",
          ),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "Transformation digitale",
          ),
          const AboutUsText(
            text:
                "Développement et maintenance des sites et applications.\n\nRéférencement Web (SEA - SEO)\n\nWeb Marketing\n\nAccompagnement et conseil en E-logistique",
          ),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "Aménagement, Agencement et bâtiment",
          ),
          const AboutUsText(
            text:
                "Conception de bâtiments éco-responsable.\n\nAménagement d’espace et agencement industriel.\n\nConseil et accompagnement d’achats d’équipements et matériels.\n\nProjets Architecture, Aménagement et Design Urbain.",
          ),
          const SizedBox(height: 20 * 3),
          const AboutUsTitle(
            title: "Qualification et renforcement des compétences",
          ),
          const AboutUsText(
            text:
                "Bilan et diagnostic  RH.\n\nManuel d’employé.\n\nFormations continues sur mesure pour Top Management. Middle management et collaborateurs.\n\nTeam Building et coaching.",
          ),
        ],
      ),
    );
  }
}
