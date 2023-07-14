import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../DataBase/Models/team.dart';

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
        ? Column(
            children: [
              Image.asset(
                teamMember!.image,
                width: 200,
                height: 200,
              ),
              Text(teamMember!.name),
              Text(teamMember!.role),
            ],
          )
        : const Center(child: Text("No member found"));
  }
}
