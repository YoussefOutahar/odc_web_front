import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:lottie/lottie.dart';

import '../../../../DataBase/Controllers/team_controller.dart';
import '../../../../DataBase/Models/team.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildTeamListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildTeamListView() => Stack(
        children: [
          StreamBuilder(
            stream: TeamController.getTeams(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Wrap(
                  children: [
                    for (var teamMember in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TeamCard(teamMember: teamMember),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    currentView = _buildAddTeamView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildAddTeamView() => Stack(
        children: [
          TeamData(
              teamMember: TeamMember(
                uid: "",
                name: "",
                role: "",
                image: "",
              ),
              onCanceled: () => setState(() {
                    currentView = _buildTeamListView();
                  })),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildTeamListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildEditTeamView(TeamMember teamMember) => Stack(
        children: [
          TeamData(
            teamMember: teamMember,
            onCanceled: () => setState(() {
              currentView = _buildTeamListView();
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
                    currentView = _buildTeamListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.teamMember});

  final TeamMember teamMember;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> with TickerProviderStateMixin {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        height: 400,
        width: 300,
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
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                    ),
                    const SizedBox(height: 60),
                    Text(
                      widget.teamMember.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(widget.teamMember.role),
                  ],
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                      text: "Know more about ",
                      children: [
                        TextSpan(
                          text: "me",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamData extends StatefulWidget {
  const TeamData(
      {super.key, required this.teamMember, required this.onCanceled});

  final TeamMember teamMember;
  final VoidCallback onCanceled;

  @override
  State<TeamData> createState() => _TeamDataState();
}

class _TeamDataState extends State<TeamData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  // final TextEditingController _imageController = TextEditingController();

  late DropzoneViewController dropZoneController;
  UploadTask? uploadTask;
  double progress = 0;
  bool _startAnimation = false;

  bool fileUploaded = false;
  String fileName = '';
  Uint8List data = Uint8List(0);

  @override
  void initState() {
    _nameController.text = widget.teamMember.name;
    _roleController.text = widget.teamMember.role;
    // _imageController.text = widget.teamMember.image;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    // _imageController.dispose();
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
                controller: _roleController,
                decoration: const InputDecoration(
                  labelText: 'Role',
                ),
              ),
              // TextField(
              //   controller: _imageController,
              //   decoration: const InputDecoration(
              //     labelText: 'Image',
              //   ),
              // ),
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
                          'files/blog/${widget.teamMember.uid}/$fileName';
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
