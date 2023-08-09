import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_file/internet_file.dart';
import 'package:odc/Services/Utils/utils.dart';
import 'package:odc/Services/constants.dart';
import 'package:pdfx/pdfx.dart';

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

  late final PdfController pdfController;

  @override
  initState() {
    Get.parameters["id"] != null
        ? teamMemberUid = Get.parameters["id"]!
        : teamMemberUid = "";

    teamMember = members.firstWhere((element) => element.uid == teamMemberUid);

    pdfController = PdfController(
      document: PdfDocument.openData(
        InternetFile.get(
          "https://www.africau.edu/images/default/sample.pdf",
          headers: {
            "Content-Type": "application/pdf",
            "Access-Control-Allow-Origin": " *",
            "Access-Control-Allow-Methods": " GET, POST",
            "Access-Control-Allow-Headers": " X-Requested-With",
          },
        ),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    pdfController.dispose();
    super.dispose();
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
                CircularProfileAvatar(
                  "",
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
              child: PdfView(
                controller: pdfController,
                renderer: (page) => page.render(
                  width: page.width,
                  height: page.height,
                  format: PdfPageImageFormat.jpeg,
                  quality: 100,
                  forPrint: true,
                ),
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
                child: PdfView(
                  controller: pdfController,
                  renderer: (page) => page.render(
                    width: page.width,
                    height: page.height,
                    format: PdfPageImageFormat.jpeg,
                    quality: 100,
                    forPrint: true,
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ),
      );
}
