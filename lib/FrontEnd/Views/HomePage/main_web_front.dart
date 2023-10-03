import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Services/route_aware_service.dart';
import 'Sections/about_section.dart';
import 'Sections/events_section.dart';
import 'Sections/formation_section.dart';
import 'Sections/conseils_section.dart';
import 'Sections/team_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RouteAwareService().getRouteObserver().subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void dispose() {
    RouteAwareService().getRouteObserver().unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    debugPrint('didPush');
    super.didPush();
  }

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
            builder: (context) => const Conseils(),
          ),
          ScrollTransformItem(
            builder: (_) => const TeamSection(),
          ),
        ],
      ),
    );
  }
}
