import 'package:flutter/material.dart';
import 'package:odc/DataBase/Models/events.dart';

import '../../../Components/section_title.dart';
import '../Components/event_card.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      child: Column(
        children: [
          const SectionTitle(
            color: Color(0xFFFF0000),
            title: "Events",
            subTitle: "Recent Events",
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 340.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: events.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: EventCard(
                  event: events[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
