import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../DataBase/Controllers/team_controller.dart';
import '../../../../../DataBase/Models/team.dart';
import '../../../../../Services/image_service.dart';
import '../../Components/drop_zone.dart';
import '../../Components/loading_animation.dart';

class TeamData extends StatefulWidget {
  const TeamData({super.key, required this.teamMember, required this.onFinished});

  final TeamMember teamMember;
  final VoidCallback onFinished;

  @override
  State<TeamData> createState() => _TeamDataState();
}

class _TeamDataState extends State<TeamData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();

  UploadTask? imageUploadTask;
  bool imageFileUploaded = false;
  String imageFileName = '';
  Uint8List imageData = Uint8List(0);

  UploadTask? cvUploadTask;
  bool cvFileUploaded = false;
  String cvFileName = '';
  Uint8List cvData = Uint8List(0);

  @override
  void initState() {
    _nameController.text = widget.teamMember.name;
    _roleController.text = widget.teamMember.role;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
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
                      child: imageFileUploaded
                          ? Column(
                              children: [
                                SizedBox(
                                    height: size.height * 0.2, width: size.width * 0.2, child: Image.memory(imageData)),
                                Text(imageFileName),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      imageFileUploaded = false;
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
                      controller: _roleController,
                      decoration: const InputDecoration(
                        labelText: 'Role',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.3,
                      child: cvFileUploaded
                          ? Column(
                              children: [
                                SizedBox(
                                    height: size.height * 0.2,
                                    width: size.width * 0.2,
                                    child: SfPdfViewer.memory(cvData)),
                                Text(cvFileName),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cvFileUploaded = false;
                                    });
                                  },
                                  icon: const Icon(Icons.restart_alt_outlined),
                                ),
                              ],
                            )
                          : TextButton.icon(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                  ],
                                );
                                if (result != null) {
                                  cvFileName = result.files.single.name;
                                  cvData = result.files.single.bytes!;
                                  setState(() {
                                    cvFileUploaded = true;
                                  });
                                }
                              },
                              icon: const Icon(Icons.upload_file),
                              label: const Text("Upload CV"),
                            ),
                    ),
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
          Positioned.fill(child: _buildUploadProgress()),
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
        imageFileName = await dropZoneController.getFilename(value);
        imageData = await dropZoneController.getFileData(value);
        imageFileUploaded = true;
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
          imageFileName = result.files.single.name;
          imageData = result.files.single.bytes!;
          setState(() {
            imageFileUploaded = true;
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
          child: imageUploadTask != null || cvUploadTask != null
              ? LoadingAnimation(
                  uploadTask: imageUploadTask ?? cvUploadTask!,
                )
              : const SizedBox(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  _upload() async {
    if (widget.teamMember.name.isEmpty || widget.teamMember.role.isEmpty || !imageFileUploaded || !cvFileUploaded) {
      TeamMember? newTeamMember = await TeamController.addTeamMember(
        TeamMember(
          name: _nameController.text,
          role: _roleController.text,
          image: "",
          pdfUrl: "",
        ),
      );

      if (newTeamMember != null) {
        try {
          final String imagePath = 'files/team/${newTeamMember.uid}/$imageFileName';
          final Reference imageRef = FirebaseStorage.instance.ref(imagePath);
          imageData = await ImageManager.compressImage(imageData);

          final String cvPath = 'files/team/${newTeamMember.uid}/$cvFileName';
          final Reference cvRef = FirebaseStorage.instance.ref(cvPath);
          cvData = await ImageManager.compressImage(cvData);
          setState(() {
            imageUploadTask = imageRef.putData(imageData);
            cvUploadTask = cvRef.putData(cvData);
          });
          await imageUploadTask!.whenComplete(() {
            setState(() {
              imageUploadTask = null;
            });
          });
          await cvUploadTask!.whenComplete(() {
            setState(() {
              cvUploadTask = null;
            });
          });
          await TeamController.updateTeamMember(
            TeamMember(
              uid: newTeamMember.uid,
              name: _nameController.text,
              role: _roleController.text,
              image: imagePath,
              pdfUrl: cvPath,
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
        final String imagePath = 'files/team/${widget.teamMember.uid}/$imageFileName';
        final Reference imageRef = FirebaseStorage.instance.ref(imagePath);
        imageData = await ImageManager.compressImage(imageData);

        final String cvPath = 'files/team/${widget.teamMember.uid}/$cvFileName';
        final Reference cvRef = FirebaseStorage.instance.ref(cvPath);
        cvData = await ImageManager.compressImage(cvData);

        await TeamController.updateTeamMember(
          TeamMember(
            uid: widget.teamMember.uid,
            name: _nameController.text,
            role: _roleController.text,
            image: imagePath,
            pdfUrl: cvPath,
          ),
        );

        setState(() {
          imageUploadTask = imageRef.putData(imageData);
          cvUploadTask = cvRef.putData(cvData);
        });
        await imageUploadTask!.whenComplete(() {
          setState(() {
            imageUploadTask = null;
          });
        });
        await cvUploadTask!.whenComplete(() {
          setState(() {
            cvUploadTask = null;
          });
        });
        setState(() {});
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
