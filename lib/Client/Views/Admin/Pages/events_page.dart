import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Controllers/events_controller.dart';
import '../../../../DataBase/Models/events.dart';
import '../Components/Events/events_data.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildEventsListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildEventsListView() => StreamBuilder<List<Event>>(
        stream: EventsController.getEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return EventCard(event: snapshot.data![index]);
                  },
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              currentView = _buildAddEventView();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else if (snapshot.hasError) {
            snapshot.error.printError();
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  _buildAddEventView() => Stack(
        children: [
          EventData(
            event: Event(
              name: '',
              description: '',
              organisation: '',
              city: '',
              theme: '',
              date: Timestamp.now(),
              image: '',
              uid: '',
            ),
            onCanceled: () => setState(() {
              currentView = _buildEventsListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildEventsListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  _buildEditEventView(Event event) => Stack(
        children: [
          EventData(
            event: event,
            onCanceled: () => setState(() {
              currentView = _buildEventsListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildEventsListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}

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
