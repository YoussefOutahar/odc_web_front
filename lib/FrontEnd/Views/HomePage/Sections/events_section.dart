import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../DataBase/Controllers/events_controller.dart';
import '../../../../Services/Utils/responsive.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      child: Column(
        children: [
          SectionTitle(
            color: const Color(0xFFFF0000),
            title: LocaleKeys.home_page_title_events.tr(),
            subTitle: LocaleKeys.home_page_subtitle_events.tr(),
          ),
          FutureBuilder(
            future: EventsController.getEventsList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  height: Responsive.isDesktop(context) ? 600 : 340,
                  width: size.width,
                  child: SliderView(
                    data: snapshot.data!,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
