import 'package:flutter/material.dart';

import '../../../../../DataBase/Controllers/team_controller.dart';
import '../../../../../DataBase/Models/team.dart';
import 'team_card.dart';
import 'team_data.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildTeamListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildTeamListView() => Stack(
        children: [
          StreamBuilder(
            stream: TeamController.getTeamMembers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Wrap(
                  children: [
                    for (var teamMember in snapshot.data!)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TeamCard(
                          teamMember: teamMember,
                          onDeleted: () {
                            TeamController.deleteTeamMember(teamMember.uid!);
                          },
                          onModified: () {
                            setState(() {
                              currentView = _buildEditTeamView(teamMember);
                            });
                          },
                        ),
                      ),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('Error');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  currentView = _buildAddTeamView();
                });
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      );

  Widget _buildAddTeamView() => Stack(
        children: [
          TeamData(
              teamMember: TeamMember(
                uid: "",
                name: "",
                role: "",
                image: "",
                pdfUrl: "",
              ),
              onFinished: () => setState(() {
                    currentView = _buildTeamListView();
                  })),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildTeamListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildEditTeamView(TeamMember teamMember) => Stack(
        children: [
          TeamData(
            teamMember: teamMember,
            onFinished: () => setState(() {
              currentView = _buildTeamListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildTeamListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}
