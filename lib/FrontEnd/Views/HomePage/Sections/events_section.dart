import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odc/DataBase/Models/events.dart';

import '../../../../Services/Utils/responsive.dart';
import '../../../../Services/Utils/utils.dart';
import '../../../Animations/animated_opacity_when_hovered.dart';
import '../../../Components/section_title.dart';
import '../Components/event_card.dart';

class EventsCarousel extends StatefulWidget {
  const EventsCarousel({
    super.key,
  });

  @override
  State<EventsCarousel> createState() => _EventsCarouselState();
}

class _EventsCarouselState extends State<EventsCarousel> {
  CarouselController scrollController = CarouselController();

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
            child: Stack(
              children: [
                Positioned.fill(
                  child: CarouselSlider(
                    carouselController: scrollController,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: 1,
                      enlargeFactor: 2,
                      height: 340,
                    ),
                    items: Responsive.isDesktop(context)
                        ? splitListIntoPairs(events)
                            .map((e) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: e
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: EventCard(
                                              event: e,
                                            ),
                                          ))
                                      .toList(),
                                ))
                            .toList()
                        : events
                            .map((e) => Builder(
                                  builder: (context) => Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: EventCard(
                                      event: e,
                                    ),
                                  ),
                                ))
                            .toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedOpacityWhenHovered(
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_left_outlined),
                        onPressed: () {
                          scrollController.previousPage();
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AnimatedOpacityWhenHovered(
                      child: IconButton(
                        onPressed: () {
                          scrollController.nextPage();
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
