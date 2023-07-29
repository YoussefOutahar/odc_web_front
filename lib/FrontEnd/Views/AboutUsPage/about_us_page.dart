import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Services/Utils/responsive.dart';
import 'Sections/formations.dart';
import 'Sections/general_info.dart';
import 'Sections/our_mission.dart';
import 'Sections/our_values.dart';
import 'Sections/who_are_we.dart';

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
