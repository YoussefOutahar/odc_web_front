import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Core/Components/deafult_button.dart';
import '../../Models/events.dart';
import '../../Models/recent_works.dart';
import '../../Models/service.dart';
import '../../Core/Components/section_title.dart';
import 'Components/about_section_text.dart';
import 'Components/experience_card.dart';
import 'Components/recent_work_card.dart';
import 'Components/service_card.dart';

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
            builder: (context) => const Services(),
          ),
          ScrollTransformItem(
            builder: (context) => const Formations(),
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
    return SizedBox(
      width: size.width,
      height: size.height,
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
            top: size.height * 0.35,
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

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("About us",
                  style: Theme.of(context).textTheme.displayMedium),
              const Expanded(
                child: AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
              const ExperienceCard(numOfExp: "08"),
              const Expanded(
                child: AboutSectionText(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore mag aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20 * 3),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     DefaultButton(
          //       imageSrc: "assets/images/hand.png",
          //       text: "Hire Me!",
          //       press: () {},
          //     ),
          //     const SizedBox(width: 20 * 1.5),
          //     DefaultButton(
          //       imageSrc: "assets/images/download.png",
          //       text: "Download CV",
          //       press: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({
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
            title: "Events",
            subTitle: "Recent Events",
          ),
          FlutterCarousel.builder(
            options: CarouselOptions(
              height: 320,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              viewportFraction: 0.5,
              onPageChanged: (index, reason) {},
            ),
            itemCount: events.length,
            itemBuilder: ((context, index, realIndex) => EventCard(
                  title: events[index].name,
                  date: events[index].date,
                  description: events[index].description,
                  imageUrl: events[index].image,
                )),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  const EventCard(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.description});

  final String imageUrl;
  final String title;
  final DateTime date;
  final String description;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 320,
      width: 540,
      child: Card(
        child: Row(
          children: [
            Image.asset("assets/images/Logo.png"),
            Center(
              child: Column(
                children: [
                  Text(widget.title),
                  Text(widget.date.toString()),
                  Text(widget.description),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Formations extends StatelessWidget {
  const Formations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20 * 6),
      width: double.infinity,
      // just for demo
      // height: 600,
      decoration: BoxDecoration(
        color: const Color(0xFFF7E8FF).withOpacity(0.3),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/recent_work_bg.png"),
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Recent Woorks",
            subTitle: "My Strong Arenas",
            color: Color(0xFFFFB100),
          ),
          const SizedBox(height: 20 * 1.5),
          Wrap(
            spacing: 20,
            runSpacing: 20 * 2,
            children: List.generate(
              recentWorks.length,
              (index) => RecentWorkCard(index: index, press: () {}),
            ),
          ),
          const SizedBox(height: 20 * 5),
        ],
      ),
    );
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
