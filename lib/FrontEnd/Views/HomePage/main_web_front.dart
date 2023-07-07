import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Components/deafult_button.dart';
import '../../../DataBase/Models/service.dart';
import '../../Components/section_title.dart';
import 'Components/service_card.dart';
import 'Sections/about_section.dart';
import 'Sections/events_section.dart';
import 'Sections/formation_section.dart';
import 'Sections/team_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: ScrollTransformView(
        children: [
          ScrollTransformItem(
            offsetBuilder: (scrollOffset) {
              double offset = 0;
              // offset by the app bar height
              offset -= kToolbarHeight;
              return Offset(0, offset);
            },
            builder: (_) => TopSection(size: size),
          ),
          ScrollTransformItem(
            builder: (context) => const AboutSection(),
          ),
          ScrollTransformItem(
            builder: (context) => const EventsCarousel(),
          ),
          ScrollTransformItem(
            builder: (context) => const Formations(),
          ),
          ScrollTransformItem(
            builder: (_) => const TeamSection(),
          ),
          ScrollTransformItem(
            builder: (context) => const Services(),
          ),
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          width: size.width,
          height: sizingInformation.isMobile
              ? size.height * 0.5
              : size.height * 0.9,
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
                top: sizingInformation.isMobile
                    ? size.height * 0.1
                    : size.height * 0.35,
                left: size.width * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello There!",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus,\n luctus nec ullamcorper mattis, pulvinar dapibus leo.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: size.height * 0.05),
                    DefaultButton(
                      imageSrc: "assets/images/logo.png",
                      press: () {},
                      text: "Learn More",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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

    // path.moveTo(0, height * 0.3);
    // path.quadraticBezierTo(
    //     widthOffset, height * 0.4, width * 0.5, height * 0.3);
    // path.quadraticBezierTo(width - widthOffset, height * 0.2, width, 0);
    // path.lineTo(width, height);

    path.lineTo(width - widthOffset, 0);
    path.cubicTo(width, 0, width, height, width - widthOffset, height);
    path.lineTo(width, height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Service Offerings",
            subTitle: "My Strong Arenas",
          ),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20 * 2,
              children: List.generate(
                  services.length, (index) => ServiceCard(index: index)),
            ),
          )
        ],
      ),
    );
  }
}