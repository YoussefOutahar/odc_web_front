import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'Pages/blog_page.dart';
import 'Pages/events_page.dart';
import 'Pages/formation_page.dart';
import 'Pages/team_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: scaffoldBackgroundColor,
              textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: canvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: actionColor.withOpacity(0.37),
                ),
                gradient: const LinearGradient(
                  colors: [accentCanvasColor, canvasColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: IconThemeData(
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
            ),
            footerDivider: divider,
            headerBuilder: (context, extended) {
              return const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image(image: AssetImage('assets/images/logo.png')),
                ),
              );
            },
            items: const [
              SidebarXItem(
                icon: Icons.home,
                label: 'Home',
              ),
              SidebarXItem(
                icon: Icons.event,
                label: 'Events',
              ),
              SidebarXItem(
                icon: Icons.article,
                label: 'Blog',
              ),
              SidebarXItem(
                icon: Icons.person,
                label: 'Team',
              ),
              SidebarXItem(
                icon: Icons.person,
                label: 'Formations',
              ),
            ],
            controller: _controller,
          ),
          Expanded(
              child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Stack(
                children: [
                  Positioned.fill(
                    child: PagesController(controller: _controller),
                  ),
                ],
              );
            },
          )),
        ],
      ),
    );
  }
}

class PagesController extends StatefulWidget {
  const PagesController({super.key, required this.controller});

  final SidebarXController controller;

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        switch (widget.controller.selectedIndex) {
          case 0:
            return pages[0];
          case 1:
            return pages[1];
          case 2:
            return pages[2];
          case 3:
            return pages[3];
          case 4:
            return pages[4];
          default:
            return const Center(
              child: Text("Not found page"),
            );
        }
      },
    );
  }

  List<Widget> pages = [
    const Center(
      child: Text("home"),
    ),
    const EventsPage(),
    const BlogPage(),
    const TeamPage(),
    const FormationsPage(),
  ];
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
