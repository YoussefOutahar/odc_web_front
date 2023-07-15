import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../DataBase/Models/team.dart';

class TeamMemberPage extends StatefulWidget {
  const TeamMemberPage({super.key});

  @override
  State<TeamMemberPage> createState() => _TeamMemberPageState();
}

class _TeamMemberPageState extends State<TeamMemberPage> {
  late TeamMember? teamMember;
  late int teamMemberId;

  @override
  initState() {
    Get.parameters["id"] != null
        ? teamMemberId = int.parse(Get.parameters["id"]!)
        : teamMemberId = 1;

    members.length > teamMemberId
        ? teamMember = members[teamMemberId]
        : teamMember = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return teamMember != null
        ? Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
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
                        const CircleAvatar(
                          radius: 70,
                        ),
                        const SizedBox(height: 60),
                        Text(
                          teamMember!.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          teamMember!.role,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Center(child: Text("No member found"));
  }
}
