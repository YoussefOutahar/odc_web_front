import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../../Core/Components/section_title.dart';
import '../../../Models/events.dart';

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