import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';
import '../Components/SliderView/slider_view.dart';

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
          SectionTitle(
            color: const Color(0xFFFF0000),
            title: LocaleKeys.home_page_title_events.tr(),
            subTitle: LocaleKeys.home_page_subtitle_events.tr(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 400,
            width: 700,
            child: const SliderView(),
          ),
        ],
      ),
    );
  }
}


// Positioned.fill(
                //   child: CarouselSlider(
                //     carouselController: scrollController,
                //     options: CarouselOptions(
                //       autoPlay: true,
                //       autoPlayInterval: const Duration(seconds: 6),
                //       autoPlayAnimationDuration:
                //           const Duration(milliseconds: 800),
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       viewportFraction: 1,
                //       enlargeFactor: 2,
                //       height: 340,
                //     ),
                //     items: Responsive.isDesktop(context)
                //         ? splitListIntoPairs(events)
                //             .map((e) => Row(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: e
                //                       .map((e) => Padding(
                //                             padding: const EdgeInsets.all(8.0),
                //                             child: EventCard(
                //                               event: e,
                //                             ),
                //                           ))
                //                       .toList(),
                //                 ))
                //             .toList()
                //         : events
                //             .map((e) => Builder(
                //                   builder: (context) => Padding(
                //                     padding: const EdgeInsets.all(8),
                //                     child: EventCard(
                //                       event: e,
                //                     ),
                //                   ),
                //                 ))
                //             .toList(),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: AnimatedOpacityWhenHovered(
                //       child: IconButton(
                //         icon: const Icon(Icons.keyboard_arrow_left_outlined),
                //         onPressed: () {
                //           scrollController.previousPage();
                //         },
                //       ),
                //     ),
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: const EdgeInsets.all(20.0),
                //     child: AnimatedOpacityWhenHovered(
                //       child: IconButton(
                //         onPressed: () {
                //           scrollController.nextPage();
                //         },
                //         icon: const Icon(Icons.keyboard_arrow_right_outlined),
                //       ),
                //     ),
                //   ),
                // )