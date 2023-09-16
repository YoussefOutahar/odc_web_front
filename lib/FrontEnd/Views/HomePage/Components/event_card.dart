import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/events.dart';
import '../../../../Services/cached_image_service.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event});

  final Event event;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  late Future<String> _imageUrl;

  @override
  void initState() {
    _imageUrl = widget.event.getImageDownloadLink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/event/${widget.event.uid}"),
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        height: 340,
        width: 540,
        decoration: BoxDecoration(
          boxShadow: [
            if (isHover)
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.1),
              )
          ],
        ),
        child: Card(
          child: Column(
            children: [
              FutureBuilder(
                future: _imageUrl,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 170,
                      width: 540,
                      child: ImageManager(
                        imageUrl: snapshot.data.toString(),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const Expanded(
                        child: Center(child: CircularProgressIndicator()));
                  }
                },
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.event.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(widget.event.date.toDate().toString()),
                      const SizedBox(height: 20),
                      Text(widget.event.description),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
