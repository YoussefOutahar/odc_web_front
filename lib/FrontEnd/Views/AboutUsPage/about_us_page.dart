import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
