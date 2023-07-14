import 'package:flutter/material.dart';

import '../../../Components/section_title.dart';
import '../../../../DataBase/Models/team.dart';

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
          const SizedBox(height: 20 * 5),
        ],
      ),
    );
  }
}

class TeamCard extends StatefulWidget {
  const TeamCard({super.key, required this.index});

  final int index;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> with TickerProviderStateMixin {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                    const CircleAvatar(
                      radius: 70,
                    ),
                    const SizedBox(height: 60),
                    Text(
                      members[widget.index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      members[widget.index].role,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                      text: "Know more about ",
                      children: [
                        TextSpan(
                          text: "me",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
