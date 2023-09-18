import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../DataBase/Models/team.dart';
import '../../../../Services/Utils/utils.dart';
import '../../../../Services/constants.dart';

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.member});

  final TeamMember member;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> with TickerProviderStateMixin {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  late Future<String> _imageUrl;

  @override
  void initState() {
    _imageUrl = widget.member.getImageDownloadLink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed("/member/${widget.member.uid}"),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _imageUrl,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CircularProfileAvatar(
                            snapshot.data.toString(),
                            initialsText: Text(
                              extractFirstLetterFromWords(widget.member.name),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            backgroundColor: kSecondaryColor,
                            borderColor: kPrimaryColor,
                            borderWidth: 2,
                            radius: 70,
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    Text(
                      widget.member.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.member.role,
                      textAlign: TextAlign.center,
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
