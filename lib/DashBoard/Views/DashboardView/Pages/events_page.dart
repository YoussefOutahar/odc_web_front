import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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

  late DropzoneViewController dropZoneController;
  UploadTask? uploadTask;
  double progress = 0;
  bool _startAnimation = false;

  bool fileUploaded = false;
  String fileName = '';
  Uint8List data = Uint8List(0);

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
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: size.width * 0.3,
                child: fileUploaded
                    ? Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.2,
                              width: size.width * 0.2,
                              child: Image.memory(data)),
                          Text(fileName),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                fileUploaded = false;
                              });
                            },
                            icon: const Icon(Icons.restart_alt_outlined),
                          ),
                        ],
                      )
                    : _buildDropZone(),
              ),
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
                    try {
                      final String path =
                          'files/blog/${widget.event.uid}/$fileName';
                      final Reference ref = FirebaseStorage.instance.ref(path);

                      // setState(() {
                      //   uploadTask = ref.putData(data);
                      // });
                      // await uploadTask!.whenComplete(() {
                      //   setState(() {
                      //     progress = 0;
                      //     uploadTask = null;
                      //   });
                      // });
                      // await FirebaseFirestore.instance
                      //     .collection('files')
                      //     .doc(userId)
                      //     .collection('files')
                      //     .doc(fileName)
                      //     .set({
                      //   'name': fileName,
                      //   'path': path,
                      //   'date': DateTime.now().toString(),
                      //   'status': false,
                      // });

                      setState(() {});
                    } catch (e) {
                      debugPrint(e.toString());
                    }
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

  Widget _buildDropZone() => Stack(
        children: [
          DottedBorder(
            color: Colors.black,
            strokeWidth: 2,
            dashPattern: const [10, 10],
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            child: DropzoneView(
              operation: DragOperation.copy,
              cursor: CursorType.grab,
              onCreated: (DropzoneViewController controller) {
                dropZoneController = controller;
              },
              mime: const [
                'image/jpeg',
                'image/png',
                'image/bmp',
                'image/gif',
                'image/jpg',
              ],
              onHover: () => setState(() {
                _startAnimation = true;
              }),
              onLeave: () => setState(() {
                _startAnimation = false;
              }),
              onDrop: (value) async {
                fileName = await dropZoneController.getFilename(value);
                data = await dropZoneController.getFileData(value);
                fileUploaded = true;
              },
            ),
          ),
          Center(
            child: Lottie.asset(
              'assets/animations/download-file-icon-animation.json',
              frameRate: FrameRate.max,
              repeat: _startAnimation,
            ),
          ),
        ],
      );
}
