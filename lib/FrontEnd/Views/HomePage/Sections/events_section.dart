import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../DataBase/Controllers/events_controller.dart';
import '../../../../Services/Utils/responsive.dart';
import '../../../../Services/constants.dart';
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
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[0],
            title: LocaleKeys.home_page_title_events.tr(),
            subTitle: LocaleKeys.home_page_subtitle_events.tr(),
          ),
          StreamBuilder(
            stream: EventsController.getEvents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  height: Responsive.isDesktop(context) ? 600 : 340,
                  width: size.width,
                  child: SliderView(
                    data: snapshot.data!,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
