import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc/Services/Utils/utils.dart';
import 'package:odc/Services/constants.dart';

import '../../../DataBase/Models/team.dart';
import '../../../Services/Utils/responsive.dart';

class TeamMemberPage extends StatefulWidget {
  const TeamMemberPage({super.key});

  @override
  State<TeamMemberPage> createState() => _TeamMemberPageState();
}

class _TeamMemberPageState extends State<TeamMemberPage> {
  late TeamMember? teamMember;
  late String teamMemberUid;

  @override
  initState() {
    Get.parameters["id"] != null
        ? teamMemberUid = Get.parameters["id"]!
        : teamMemberUid = "";

    teamMember = members.firstWhere((element) => element.uid == teamMemberUid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return teamMember != null
        ? Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircularProfileAvatar(
                          "",
                          initialsText: Text(
                            extractFirstLetterFromWords(teamMember!.name),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                          borderColor: createMaterialColor(
                              const Color.fromARGB(255, 76, 95, 171)),
                          radius: Responsive.isMobile(context)
                              ? size.width / 7
                              : size.height / 6,
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 3),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: kDefaultPadding),
                          child: Text(
                            teamMember!.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: kDefaultPadding),
                          child: Text(
                            teamMember!.role,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding * 2),
                      // Text(
                      //   "data",
                      //   textAlign: TextAlign.center,
                      //   style: Theme.of(context).textTheme.bodyLarge,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          )
        : const Center(child: Text("No member found"));
  }
}
