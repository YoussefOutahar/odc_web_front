import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Services/responsive.dart';
import '../../Components/section_title.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: ScrollTransformView(
        children: [
          ScrollTransformItem(
            offsetBuilder: (scrollOffset) {
              double offset = 0;
              offset -= kToolbarHeight;
              return Offset(0, offset);
            },
            builder: (_) => TopSection(size: size),
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

class OurValues extends StatelessWidget {
  const OurValues({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
              title: "Our Values", subTitle: "", color: Colors.orange),
          Image.asset("assets/images/values.png"),
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
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Découvrez notre entreprise, votre partenaire privilégié pour votre développement personnel et professionnel. Notre vaste gamme de formations comprend des solutions sur mesure, des programmes de renforcement des soft skills, des formations spécialisées pour les doctorants et même des expériences uniques de voyage et d'apprentissage. Que vous souhaitiez renforcer vos compétences techniques, améliorer votre communication interpersonnelle, approfondir vos connaissances académiques ou vivre une expérience d'apprentissage immersive, nous avons tout ce dont vous avez besoin. Nos formateurs qualifiés et expérimentés vous guideront dans votre parcours de formation, en vous offrant des cours pertinents, interactifs et adaptés à vos besoins spécifiques. Investissez dans votre croissance professionnelle avec nous et ouvrez-vous à un monde de possibilités",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                height: 2,
              ),
            ),
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
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "SCM & Smart Système",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Optimisation et amélioration de la Supply Chain (Achats, Approvisionnement, Production, Distribution et logistique de retour)\n\n* Audit logistique (Supply Chain Master, SCOR(APICS))\n\n* Instauration du Lean Management\n\n* Solution IT adaptée et sur-mesure ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * 4),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Certification ISO",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Audit d’évaluation de la maturité SMQ de l’organisation\n\n* Réalisation/Correction du manuel qualité\n\n* Formation au système management de la qualité\n\n* Tableau de bord ISO",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * 4),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Energie & exploitation énergétique",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Optimisation de l’exploitation énergétique dans les bâtiments \n\n* Audit énergétique\n\n* Amélioration du confort thermique",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * 4),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Transformation digitale",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Développement et maintenance des sites et applications.\n\n* Référencement Web (SEA - SEO)\n\n* Web Marketing\n\n* Accompagnement et conseil en E-logistique",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * 4),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Aménagement, Agencement et bâtiment",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Conception de bâtiments éco-responsable.\n\n* Aménagement d’espace et agencement industriel.\n\n* Conseil et accompagnement d’achats d’équipements et matériels.\n\n* Projets Architecture, Aménagement et Design Urbain.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * 4),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Qualification et renforcement des compétences",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
          ),
          SizedBox(height: 20 * 3),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "* Bilan et diagnostic  RH.\n\n* Manuel d’employé.\n\n* Formations continues sur mesure pour Top Management. Middle management et collaborateurs.\n\n* Team Building et coaching.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
