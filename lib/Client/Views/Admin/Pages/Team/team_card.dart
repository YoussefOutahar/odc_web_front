import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../DataBase/Models/team.dart';

class TeamCard extends StatefulWidget {
  const TeamCard(
      {super.key,
      required this.teamMember,
      required this.onModified,
      required this.onDeleted});

  final TeamMember teamMember;
  final VoidCallback onModified;
  final VoidCallback onDeleted;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> with TickerProviderStateMixin {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  String? imageUrl;

  @override
  void initState() {
    loadImageUrl();
    super.initState();
  }

  Future<void> loadImageUrl() async {
    String downloadUrl = await FirebaseStorage.instance
        .ref(widget.teamMember.image)
        .getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        String dataUrl = await FirebaseStorage.instance
            .ref(widget.teamMember.pdfUrl)
            .getDownloadURL();

        // ignore: use_build_context_synchronously
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 500,
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SfPdfViewer.network(dataUrl),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
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
            BoxShadow(
              blurRadius: 20,
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
                    imageUrl != null
                        ? CircleAvatar(
                            radius: 50,
                            foregroundImage:
                                CachedNetworkImageProvider(imageUrl!),
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(height: 20),
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
              Positioned(
                right: 5,
                bottom: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: widget.onModified,
                      child: const Text("Modify"),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: widget.onDeleted,
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
