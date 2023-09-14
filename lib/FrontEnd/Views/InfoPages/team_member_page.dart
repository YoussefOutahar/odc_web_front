import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odc/Services/Utils/utils.dart';
import 'package:odc/Services/constants.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../DataBase/Controllers/team_controller.dart';
import '../../../DataBase/Models/team.dart';
import '../../../Services/Utils/responsive.dart';

class TeamMemberPage extends StatefulWidget {
  const TeamMemberPage({super.key});

  @override
  State<TeamMemberPage> createState() => _TeamMemberPageState();
}

class _TeamMemberPageState extends State<TeamMemberPage> {
  TeamMember? teamMember;
  late String teamMemberUid;

  String dataUrl = "https://www.africau.edu/images/default/sample.pdf";

  @override
  initState() {
    Get.parameters["id"] != null
        ? teamMemberUid = Get.parameters["id"]!
        : teamMemberUid = "Error";

    TeamController.getTeamMember(teamMemberUid).then((value) => setState(() {
          teamMember = value;
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return teamMember != null
        ? Responsive.isDesktop(context) || Responsive.isTablet(context)
            ? _buildDesktopTab(size)
            : Responsive.isMobile(context)
                ? _buildMobile(size)
                : const SizedBox.shrink()
        : const Center(child: Text("No member found"));
  }

  Widget _buildDesktopTab(Size size) => Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                FutureBuilder(
                  future: teamMember!.getImageDownloadLink,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CircularProfileAvatar(
                        snapshot.data.toString(),
                        initialsText: Text(
                          extractFirstLetterFromWords(teamMember!.name),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                        backgroundColor: kSecondaryColor,
                        borderColor: kPrimaryColor,
                        borderWidth: 2,
                        radius: Responsive.isMobile(context)
                            ? size.width / 7
                            : size.height / 6,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: kDefaultPadding * 2),
                Text(
                  teamMember!.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: kDefaultPadding * 2),
                Text(
                  teamMember!.role,
                ),
              ],
            ),
            Container(
                height: 564,
                width: 400,
                color: Colors.white,
                child: SfPdfViewer.network(
                  dataUrl,
                  headers: const {
                    "Content-Type": "application/pdf",
                    "Accept": "application/pdf",
                    "Access-Control-Allow-Origin": "*"
                  },
                )),
          ],
        ),
      );

  Widget _buildMobile(Size size) => Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProfileAvatar(
                "",
                initialsText: Text(
                  extractFirstLetterFromWords(teamMember!.name),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                backgroundColor: kPrimaryColor,
                borderColor: kSecondaryColor,
                radius: Responsive.isMobile(context)
                    ? size.width / 7
                    : size.height / 6,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Text(
                  teamMember!.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Padding(
                padding: const EdgeInsets.only(left: kDefaultPadding),
                child: Text(
                  teamMember!.role,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.white,
                  child: SfPdfViewer.network(
                    dataUrl,
                  )),
              const SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ),
      );
}
