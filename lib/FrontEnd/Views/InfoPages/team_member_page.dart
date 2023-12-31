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

  late Future<String> _pdfUrl;
  late Future<String> _imgUrl;

  @override
  initState() {
    Get.parameters["id"] != null
        ? teamMemberUid = Get.parameters["id"]!
        : teamMemberUid = "Error";

    TeamController.getTeamMember(teamMemberUid).then((value) => setState(() {
          teamMember = value;
          _imgUrl = teamMember!.getImageDownloadLink;
          _pdfUrl = teamMember!.getPdfDownloadLink;
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
                  future: _imgUrl,
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
              child: FutureBuilder(
                future: _pdfUrl,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SfPdfViewer.network(
                      snapshot.data.toString(),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      );

  Widget _buildMobile(Size size) => Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: _imgUrl,
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
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  teamMember!.name,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  teamMember!.role,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                child: FutureBuilder(
                  future: _pdfUrl,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SfPdfViewer.network(
                        snapshot.data.toString(),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ),
      );
}
