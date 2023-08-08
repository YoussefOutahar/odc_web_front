import 'package:flutter/material.dart';

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
              PageHeader(
                imgSrc: "assets/images/OpenSourceImages/img3.png",
                size: size,
                subTitle: '',
                title: '',
              ),
              // Image.asset(
              //   ,
              //   filterQuality: FilterQuality.high,
              //   fit: BoxFit.cover,
              //   width: double.maxFinite,
              //   height: 500,
              // ),
              const SizedBox(height: 60),
              Text(
                event!.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(event!.date.toDate().toString()),
              const SizedBox(height: 20),
              Text(event!.description),
              Text(event!.city),
              Text(event!.organisation),
              Text(event!.theme),
            ],
          )
        : const Center(child: Text("Event not found!"));
  }
}
