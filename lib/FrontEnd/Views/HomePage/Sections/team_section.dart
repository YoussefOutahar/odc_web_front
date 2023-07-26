import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../Services/Utils/responsive.dart';
import '../../../../Services/Utils/utils.dart';
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
      // margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      // constraints: const BoxConstraints(maxWidth: 1110),
      margin: const EdgeInsets.only(top: 20 * 6),
      width: double.infinity,
      child: Column(
        children: [
          const SectionTitle(
            color: Colors.red,
            subTitle: 'Meet the team behind ODC',
            title: 'Our Team',
          ),
          const SizedBox(height: 20 * 1.5),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 500,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CarouselSlider(
                    carouselController: scrollController,
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      viewportFraction: Responsive.isDesktop(context)
                          ? 2
                          : Responsive.isTablet(context)
                              ? 1
                              : 0.5,
                      height: 400,
                    ),
                    items: Responsive.isMobile(context)
                        ? members
                            .map((e) => Builder(
                                  builder: (context) => TeamCard(member: e),
                                ))
                            .toList()
                        : Responsive.isTablet(context)
                            ? splitListIntoSubsets(members, 2)
                                .map(
                                  (e) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: e
                                        .map((e) => TeamCard(member: e))
                                        .toList(),
                                  ),
                                )
                                .toList()
                            : splitListIntoSubsets(members, 3)
                                .map(
                                  (e) => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: e
                                        .map((e) => TeamCard(member: e))
                                        .toList(),
                                  ),
                                )
                                .toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                    padding: const EdgeInsets.all(20.0),
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
