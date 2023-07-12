import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:odc/DataBase/Models/events.dart';

import '../../../Components/section_title.dart';

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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 400.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: EventCard(
                  title: events[index].name,
                  date: events[index].date.toDate(),
                  description: events[index].description,
                  imageUrl: events[index].image,
                ),
              ),
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
    return AnimatedContainer(
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
    );
  }
}
