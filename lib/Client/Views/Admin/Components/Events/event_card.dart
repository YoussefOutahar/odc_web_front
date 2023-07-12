import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../DataBase/Models/events.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  String? imageUrl;

  @override
  void initState() {
    loadImageUrl();
    super.initState();
  }

  Future<void> loadImageUrl() async {
    String downloadUrl =
        await FirebaseStorage.instance.ref(widget.event.image).getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
            leading: imageUrl != null
                ? SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const CircularProgressIndicator(),
            title: Text(widget.event.name),
            subtitle: Text(widget.event.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    // await EventsController.deleteEvent(
                    //     snapshot.data![index].uid);
                    Get.snackbar(
                      'Event Deleted',
                      'Event Deleted Successfully',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
