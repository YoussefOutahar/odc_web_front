import 'package:flutter/material.dart';

import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/team.dart';
import '../Components/team_card.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

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
            height: 400.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: members.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TeamCard(index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
