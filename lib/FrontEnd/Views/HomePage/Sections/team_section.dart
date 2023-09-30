import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../DataBase/Controllers/team_controller.dart';
import '../../../../Services/Utils/responsive.dart';
import '../../../../Services/Utils/utils.dart';
import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Animations/animated_opacity_when_hovered.dart';
import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/team.dart';
import '../Components/team_card.dart';

class TeamSection extends StatefulWidget {
  const TeamSection({super.key});

  @override
  State<TeamSection> createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
  CarouselController scrollController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding * 2),
      width: double.infinity,
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[3],
            subTitle: LocaleKeys.home_page_subtitle_team.tr(),
            title: LocaleKeys.home_page_title_team.tr(),
          ),
          const SizedBox(height: kDefaultPadding * 1.5),
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            height: 500,
            child: Stack(
              children: [
                Positioned.fill(
                  child: StreamBuilder<List<TeamMember>>(
                    stream: TeamController.getTeamMembers(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<TeamMember> members = snapshot.data!;
                        return CarouselSlider(
                          carouselController: scrollController,
                          options: CarouselOptions(
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 6),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            viewportFraction: Responsive.isDesktop(context)
                                ? 1
                                : Responsive.isTablet(context)
                                    ? 1
                                    : 0.7,
                            height: 400,
                          ),
                          items: Responsive.isMobile(context)
                              ? members
                                  .map((e) => Builder(
                                        builder: (context) => Padding(
                                          padding: const EdgeInsets.only(
                                            left: kDefaultPadding,
                                            right: kDefaultPadding,
                                          ),
                                          child: TeamCard(member: e),
                                        ),
                                      ))
                                  .toList()
                              : Responsive.isTablet(context)
                                  ? splitListIntoSubsets(members, 2)
                                      .map(
                                        (e) => Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: e
                                              .map((e) => Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: kDefaultPadding,
                                                      right: kDefaultPadding,
                                                    ),
                                                    child: TeamCard(member: e),
                                                  ))
                                              .toList(),
                                        ),
                                      )
                                      .toList()
                                  : splitListIntoSubsets(members, 3)
                                      .map(
                                        (e) => Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: e
                                              .map((e) => Padding(
                                                    padding: const EdgeInsets.only(
                                                      left: kDefaultPadding,
                                                      right: kDefaultPadding,
                                                    ),
                                                    child: TeamCard(member: e),
                                                  ))
                                              .toList(),
                                        ),
                                      )
                                      .toList(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: AnimatedOpacityWhenHovered(
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_left_outlined),
                        onPressed: () {
                          scrollController.previousPage();
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: AnimatedOpacityWhenHovered(
                      child: IconButton(
                        onPressed: () {
                          scrollController.nextPage();
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
