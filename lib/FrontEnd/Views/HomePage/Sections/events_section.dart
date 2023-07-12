import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/events.dart';

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
          ResponsiveBuilder(
            builder: (context, sizingInfo) => FlutterCarousel.builder(
              options: CarouselOptions(
                height: 320,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
                viewportFraction:
                    sizingInfo.deviceScreenType == DeviceScreenType.desktop
                        ? 0.5
                        : sizingInfo.deviceScreenType == DeviceScreenType.tablet
                            ? 0.6
                            : 0.8,
                onPageChanged: (index, reason) {},
              ),
              itemCount: events.length,
              itemBuilder: ((context, index, realIndex) => EventCard(
                    title: events[index].name,
                    date: events[index].date.toDate(),
                    description: events[index].description,
                    imageUrl: events[index].image,
                  )),
            ),
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
    return ResponsiveBuilder(
      builder: ((context, sizingInformation) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 340,
            width: 540,
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 170,
                    width: 540,
                    child: Image.asset(
                      "assets/images/OpenSourceImages/img3.png",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(widget.date.toString()),
                          const SizedBox(height: 20),
                          Text(widget.description),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
