import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../DataBase/Controllers/events_controller.dart';
import '../../../../../DataBase/Models/events.dart';
import '../../../../../Services/image_service.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event, required this.onEdit});

  final Event event;

  final VoidCallback onEdit;

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
    String downloadUrl = await FirebaseStorage.instance.ref(widget.event.image).getDownloadURL();
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
                  child: CachedImageManager(
                    imageUrl: imageUrl,
                  ),
                )
              : const CircularProgressIndicator(),
          title: Text(widget.event.name),
          subtitle: Text(widget.event.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: widget.onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await EventsController.deleteEvent(widget.event.uid!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
