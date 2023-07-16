import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Services/Utils/responsive.dart';
import '../../Components/section_title.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollTransformView(
        children: [
          // ScrollTransformItem(
          //   offsetBuilder: (scrollOffset) {
          //     double offset = 0;
          //     offset -= kToolbarHeight;
          //     return Offset(0, offset);
          //   },
          //   builder: (_) => TopSection(size: size),
          // ),
          ScrollTransformItem(
            builder: (_) => const WhoAreWe(),
          ),
          ScrollTransformItem(
            builder: (_) => const OurMission(),
          ),
          ScrollTransformItem(
            builder: (_) => const OurValues(),
          ),
          ScrollTransformItem(
            builder: (_) => const Formations(),
          ),
          ScrollTransformItem(
            builder: (_) => const GeneralInfo(),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height:
          Responsive.isMobile(context) ? size.height * 0.5 : size.height * 0.9,
      child: Stack(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/OpenSourceImages/img2.png",
                fit: BoxFit.cover,
                width: size.width,
              ),
              ClipPath(
                clipper: TopSectionClipper(),
                child: Container(
                  width: size.width,
                ).blurred(blur: 5, blurColor: Colors.white),
              )
            ],
          ),
          Positioned(
            top: Responsive.isMobile(context)
                ? size.height * 0.1
                : size.height * 0.35,
            left: size.width * 0.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About Us",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus,\n luctus nec ullamcorper mattis, pulvinar dapibus leo.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopSectionClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double widthOffset = width * 0.3;
    Path path = Path();

    path.moveTo(0, height * 0.3);
    path.quadraticBezierTo(
        widthOffset, height * 0.4, width * 0.5, height * 0.3);
    path.quadraticBezierTo(width - widthOffset, height * 0.2, width, 0);
    path.lineTo(width, height);

    // path.lineTo(width - widthOffset, 0);
    // path.cubicTo(width, 0, width, height, width - widthOffset, height);
    // path.lineTo(width, height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class WhoAreWe extends StatelessWidget {
  const WhoAreWe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: const Column(
        children: [
          SectionTitle(
              title: "Who are we", subTitle: "", color: Colors.blueGrey),
          SizedBox(height: 20 * 3),
          Text(
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
          SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}

class OurValues extends StatefulWidget {
  const OurValues({super.key});

  @override
  State<OurValues> createState() => _OurValuesState();
}

class _OurValuesState extends State<OurValues> {
  final List<String> values = [
    "Ecoute",
    "Innovation",
    "Transparence",
    "Engagement",
    "Intégrité"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
              title: "Our Values", subTitle: "", color: Colors.orange),
          const SizedBox(
            height: 40,
          ),
          Wrap(
            spacing: 60,
            runSpacing: 60,
            children: values
                .map((e) => Column(
                      children: [
                        // Roudned red Container with index
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              (values.indexOf(e) + 1).toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          e,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}

class OurMission extends StatelessWidget {
  const OurMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
              title: "Our Mission", subTitle: "", color: Colors.orange),
          const SizedBox(height: 20 * 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/text/description1.png"),
          ),
          const SizedBox(height: 20 * 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/text/description2.png"),
          ),
          const SizedBox(height: 20 * 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/text/description3.png"),
          ),
        ],
      ),
    );
  }
}

class Formations extends StatelessWidget {
  const Formations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: const Column(
        children: [
          SectionTitle(
              title: "Formations", subTitle: "", color: Colors.blueGrey),
          AboutUsText(
            text:
                "Découvrez notre entreprise, votre partenaire privilégié pour votre développement personnel et professionnel. Notre vaste gamme de formations comprend des solutions sur mesure, des programmes de renforcement des soft skills, des formations spécialisées pour les doctorants et même des expériences uniques de voyage et d'apprentissage. Que vous souhaitiez renforcer vos compétences techniques, améliorer votre communication interpersonnelle, approfondir vos connaissances académiques ou vivre une expérience d'apprentissage immersive, nous avons tout ce dont vous avez besoin. Nos formateurs qualifiés et expérimentés vous guideront dans votre parcours de formation, en vous offrant des cours pertinents, interactifs et adaptés à vos besoins spécifiques. Investissez dans votre croissance professionnelle avec nous et ouvrez-vous à un monde de possibilités",
          ),
        ],
      ),
    );
  }
}

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SectionTitle(
              title: "What we do", subTitle: "", color: Colors.blueGrey),
          AboutUsTitle(
            title: "SCM & Smart Système",
          ),
          AboutUsText(
            text:
                "Optimisation et amélioration de la Supply Chain (Achats, Approvisionnement, Production, Distribution et logistique de retour)\n\nAudit logistique (Supply Chain Master, SCOR(APICS))\n\nInstauration du Lean Management\n\nSolution IT adaptée et sur-mesure ",
          ),
          SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: "Certification ISO",
          ),
          AboutUsText(
            text:
                "Audit d’évaluation de la maturité SMQ de l’organisation\n\nRéalisation/Correction du manuel qualité\n\nFormation au système management de la qualité\n\nTableau de bord ISO",
          ),
          SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: "Energie & exploitation énergétique",
          ),
          AboutUsText(
            text:
                "Optimisation de l’exploitation énergétique dans les bâtiments \n\nAudit énergétique\n\nAmélioration du confort thermique",
          ),
          SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: "Transformation digitale",
          ),
          AboutUsText(
            text:
                "Développement et maintenance des sites et applications.\n\nRéférencement Web (SEA - SEO)\n\nWeb Marketing\n\nAccompagnement et conseil en E-logistique",
          ),
          SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: "Aménagement, Agencement et bâtiment",
          ),
          AboutUsText(
            text:
                "Conception de bâtiments éco-responsable.\n\nAménagement d’espace et agencement industriel.\n\nConseil et accompagnement d’achats d’équipements et matériels.\n\nProjets Architecture, Aménagement et Design Urbain.",
          ),
          SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: "Qualification et renforcement des compétences",
          ),
          AboutUsText(
            text:
                "Bilan et diagnostic  RH.\n\nManuel d’employé.\n\nFormations continues sur mesure pour Top Management. Middle management et collaborateurs.\n\nTeam Building et coaching.",
          ),
        ],
      ),
    );
  }
}

class AboutUsTitle extends StatelessWidget {
  const AboutUsTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class AboutUsText extends StatelessWidget {
  const AboutUsText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}
