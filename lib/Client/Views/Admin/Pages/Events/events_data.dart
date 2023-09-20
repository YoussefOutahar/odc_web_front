import 'dart:html' hide VoidCallback;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import '../../../../../DataBase/Controllers/events_controller.dart';
import '../../../../../DataBase/Models/events.dart';
import '../../../../../Services/image_service.dart';
import '../../Components/drop_zone.dart';
import '../../Components/loading_animation.dart';

class EventData extends StatefulWidget {
  const EventData({super.key, required this.event, required this.onFinished});

  final Event event;
  final VoidCallback onFinished;

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

  UploadTask? uploadTask;
  double progress = 0;

  bool fileUploaded = false;

  // file data
  String fileName = '';
  Uint8List data = Uint8List(0);
  String filePath = '';

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
    return IgnorePointer(
      ignoring: _isLoading,
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 40, right: 40),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      child: fileUploaded
                          ? Column(
                              children: [
                                SizedBox(height: size.height * 0.2, width: size.width * 0.2, child: Image.memory(data)),
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
                    onPressed: widget.onFinished,
                    child: const Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await _upload();
                      setState(() {
                        widget.onFinished();
                      });
                    },
                    child: const Text('Done'),
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(child: _buildUploadProgress())
        ],
      ),
    );
  }

  late DropzoneViewController dropZoneController;
  Widget _buildDropZone() {
    return DropZone(
      onCreated: (DropzoneViewController controller) {
        dropZoneController = controller;
      },
      onDrop: (value) async {
        fileName = await dropZoneController.getFilename(value);
        data = await dropZoneController.getFileData(value);
        filePath = await dropZoneController.createFileUrl(value);
        fileUploaded = true;
        setState(() {});
      },
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'jpg',
            'jpeg',
            'png',
            'bmp',
            'gif',
          ],
        );
        if (result != null) {
          fileName = result.files.single.name;
          data = result.files.single.bytes!;
          File file = File(data, fileName);
          filePath = await dropZoneController.createFileUrl(file);
          setState(() {
            fileUploaded = true;
          });
        }
      },
    );
  }

  bool _isLoading = false;
  Widget _buildUploadProgress() {
    if (_isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: uploadTask != null
              ? LoadingAnimation(
                  uploadTask: uploadTask!,
                )
              : const SizedBox(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

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
          final String path = 'files/event/${newEvent.uid}/$fileName';
          final Reference ref = FirebaseStorage.instance.ref(path);
          data = await ImageManager.compressImage(data, filePath);
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
        final String path = 'files/event/${widget.event.uid}/$fileName';
        final Reference ref = FirebaseStorage.instance.ref(path);
        data = await ImageManager.compressImage(data, filePath);
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
