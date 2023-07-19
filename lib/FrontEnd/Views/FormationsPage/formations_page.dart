import 'dart:ui';
import 'dart:math' as math;

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Services/Utils/responsive.dart';
import '../../Components/deafult_button.dart';
import '../../Components/section_title.dart';

class FormationsPage extends StatefulWidget {
  const FormationsPage({super.key});

  @override
  State<FormationsPage> createState() => _FormationsPageState();
}

class _FormationsPageState extends State<FormationsPage> {
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
            builder: (_) => const SurMesures(),
          ),
          ScrollTransformItem(
            builder: (_) => const SoftSkills(),
          ),
          ScrollTransformItem(
            builder: (_) => const FormationDoctorant(),
          ),
          ScrollTransformItem(
            builder: (_) => const LearningTravel(),
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
                  "Nos Formations",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus,\n luctus nec ullamcorper mattis, pulvinar dapibus leo.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: size.height * 0.05),
                DefaultButton(
                  press: () {},
                  text: "Learn More",
                ),
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

class SurMesures extends StatelessWidget {
  const SurMesures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
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
            imageSrc: "assets/images/formations/background1.png",
          )
          // Image.asset("assets/images/formations/sur_mesures.png"),
        ],
      ),
    );
  }
}

class SoftSkills extends StatelessWidget {
  const SoftSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Soft Skills",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs:
                "* Certificat PNL\n\n* Prise de decision\n\n* Innovation et business\n\n* Santé social et bien être",
            press: () {
              Get.toNamed("/formations/softSkills");
            },
            imageSrc: "assets/images/formations/background2.png",
          )
        ],
      ),
    );
  }
}

class FormationDoctorant extends StatelessWidget {
  const FormationDoctorant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
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
            imageSrc: "assets/images/formations/background3.jpg",
          )
        ],
      ),
    );
  }
}

class LearningTravel extends StatelessWidget {
  const LearningTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Learning Travel",
            subTitle: "Recent Events",
          ),
          const SizedBox(height: 20 * 2),
          ForamationCard(
            packs:
                "* Voyage Programmation Informatique\n\n* Voyage découverte pédagogique \n\n* Voyage entreprenariat",
            press: () {
              Get.toNamed("/formations/learningTravel");
            },
            imageSrc: "assets/images/OpenSourceImages/img10.png",
          )
        ],
      ),
    );
  }
}

class ForamationCard extends StatelessWidget {
  const ForamationCard(
      {super.key,
      required this.packs,
      required this.press,
      required this.imageSrc});

  final String packs;
  final VoidCallback press;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 900,
      height: 400,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Image.asset(
              imageSrc,
              fit: BoxFit.cover,
              width: 900,
              height: 400,
            ),
            Center(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    margin: const EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        packs,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultButton(
                  press: press,
                  text: 'Learn more',
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset("assets/images/odc_pattern.png")),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
