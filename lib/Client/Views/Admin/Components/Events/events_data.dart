import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:lottie/lottie.dart';

import '../../../../../DataBase/Controllers/events_controller.dart';
import '../../../../../DataBase/Models/events.dart';

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
  DateTime selectedDate = DateTime.now();

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
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                initialValue: '',
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                onSaved: (val) => selectedDate = DateTime.parse(val!),
              )
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
                    await _upload();
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

  _upload() async {
    if (widget.event.name.isEmpty ||
        widget.event.description.isEmpty ||
        widget.event.theme.isEmpty ||
        widget.event.city.isEmpty ||
        widget.event.organisation.isEmpty) {
      Event? newEvent = await EventsController.addEvent(
        Event(
          name: _nameController.text,
          description: _descriptionController.text,
          organisation: _organisationController.text,
          city: _cityController.text,
          theme: _themeController.text,
          date: Timestamp.fromDate(selectedDate),
          image: "",
        ),
      );

      if (newEvent != null) {
        try {
          final String path = 'files/blog/${newEvent.uid}/$fileName';
          final Reference ref = FirebaseStorage.instance.ref(path);
          setState(() {
            uploadTask = ref.putData(data);
          });
          await uploadTask!.whenComplete(() {
            setState(() {
              uploadTask = null;
            });
          });

          await EventsController.updateEvent(
            Event(
              uid: newEvent.uid,
              name: _nameController.text,
              description: _descriptionController.text,
              organisation: _organisationController.text,
              city: _cityController.text,
              theme: _themeController.text,
              date: Timestamp.fromDate(selectedDate),
              image: path,
            ),
          );
          setState(() {});
        } catch (e) {
          debugPrint(e.toString());
        }
      } else {
        debugPrint('Error');
      }
    } else {
      try {
        final String path = 'files/blog/${widget.event.uid}/$fileName';

        debugPrint(path);
        final Reference ref = FirebaseStorage.instance.ref(path);
        await EventsController.updateEvent(
          Event(
            uid: widget.event.uid,
            name: _nameController.text,
            description: _descriptionController.text,
            organisation: _organisationController.text,
            city: _cityController.text,
            theme: _themeController.text,
            date: Timestamp.fromDate(selectedDate),
            image: path,
          ),
        );

        setState(() {
          uploadTask = ref.putData(data);
        });
        await uploadTask!.whenComplete(() {
          setState(() {
            uploadTask = null;
          });
        });
        setState(() {});
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
