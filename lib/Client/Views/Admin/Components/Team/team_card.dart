import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../DataBase/Models/team.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.teamMember});

  final TeamMember teamMember;

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
                    imageUrl != null
                        ? SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const CircularProgressIndicator(),
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
