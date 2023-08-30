import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:odc/Services/constants.dart';

import '../../../DataBase/Models/events.dart';
import '../../Components/page_header.dart';

class EventInfoPage extends StatefulWidget {
  const EventInfoPage({super.key});

  @override
  State<EventInfoPage> createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage> {
  late Event? event;
  late int eventId;

  @override
  void initState() {
    // Get.parameters["id"] != null
    //     ? eventId = int.parse(Get.parameters['id']!)
    //     : eventId = 5;

    eventId = 5;
    events.length > eventId ? event = events[eventId] : event = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return event != null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Transform.translate(
                offset: const Offset(0, -kToolbarHeight * 1.2),
                child: PageHeader(
                  imgSrc: "assets/images/OpenSourceImages/img3.png",
                  size: size,
                  subTitle: '',
                  title: event!.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    Text(
                      event!.date.toDate().toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(),
                    Text(
                      event!.theme,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: SizedBox(
                  width: size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: MarkdownBody(
                        data: event!.description,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          p: const TextStyle(
                            fontFamily: "Raleway",
                            color: Color(0xFF191919),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    Text(
                      event!.city,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(),
                    Text(
                      event!.organisation,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          )
        : Center(
            child: Text(
              "Event not found!",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          );
  }
}
