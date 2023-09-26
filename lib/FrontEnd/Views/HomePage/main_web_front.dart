import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Sections/about_section.dart';
import 'Sections/events_section.dart';
import 'Sections/formation_section.dart';
import 'Sections/services_section.dart';
import 'Sections/team_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScrollTransformView(
        children: [
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
            builder: (context) => const Services(),
          ),
          ScrollTransformItem(
            builder: (_) => const TeamSection(),
          ),
        ],
      ),
    );
  }
}
