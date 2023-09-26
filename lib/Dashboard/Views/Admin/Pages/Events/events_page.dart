import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../DataBase/Controllers/events_controller.dart';
import '../../../../../DataBase/Models/events.dart';
import 'event_card.dart';
import 'events_data.dart';

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
                    return EventCard(
                      event: snapshot.data![index],
                      onEdit: () {
                        setState(() {
                          currentView = _buildEditEventView(snapshot.data![index]);
                        });
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        currentView = _buildAddEventView();
                      });
                    },
                    child: const Icon(Icons.add),
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
            onFinished: () => setState(() {
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
            onFinished: () => setState(() {
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
