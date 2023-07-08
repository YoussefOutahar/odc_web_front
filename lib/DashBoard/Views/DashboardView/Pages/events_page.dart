import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Controllers/events_controller.dart';
import '../../../../DataBase/Models/events.dart';

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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(snapshot.data![index].description),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.mode_edit),
                                  onPressed: () async {
                                    setState(() {
                                      currentView = _buildEditEventView(
                                          snapshot.data![index]);
                                    });
                                  },
                                ),
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

class EventData extends StatefulWidget {
  const EventData({super.key, required this.event, required this.onCanceled});

  final Event event;
  final VoidCallback onCanceled;

  @override
  State<EventData> createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final TextEditingController _organisationController = TextEditingController();
  // TextEditingController _dateController = TextEditingController();
  // TextEditingController _imageController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.event.name;
    _descriptionController.text = widget.event.description;
    _organisationController.text = widget.event.organisation;
    _cityController.text = widget.event.city;
    _themeController.text = widget.event.theme;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _cityController.dispose();
    _themeController.dispose();
    _organisationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextField(
                controller: _organisationController,
                decoration: const InputDecoration(
                  labelText: 'Organisation',
                ),
              ),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                ),
              ),
              TextField(
                controller: _themeController,
                decoration: const InputDecoration(
                  labelText: 'Theme',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: widget.onCanceled,
                  child: const Text('Cancel'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // await EventsController.updateEvent();
                  },
                  child: const Text('Done'),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
