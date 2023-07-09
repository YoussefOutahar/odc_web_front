import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../footer.dart';
import 'tab_tile.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            floating: true,
            leading: Builder(
              builder: (context) => // Ensure Scaffold is in context
                  IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [widget.child, const Footer()],
            ),
          )
        ],
      ),
      endDrawerEnableOpenDragGesture: true,
      drawer: const SliderMenu(),
    );
  }
}

class SliderMenu extends StatelessWidget {
  const SliderMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 50.0,
            ),
          ),
          const SizedBox(height: 40.0),
          TabTile(text: "Home", onTap: () => Get.offAndToNamed("/home")),
          TabTile(text: "About", onTap: () => Get.toNamed("/aboutUs")),
          TabTile(text: "Formations", onTap: () => Get.toNamed("/formations")),
          TabTile(text: "Blog", onTap: () => Get.toNamed("/blog")),
          TabTile(text: "Contact Us", onTap: () => Get.toNamed("/contactUs")),
          const SizedBox(height: 20.0),
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Container(
          //       padding: const EdgeInsets.all(20.0),
          //       child: AuthController.checkIfLogged()
          //           ? _buildLoggedIn()
          //           : _buildNotLoggedIn(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _buildNotLoggedIn() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    );
  }

  _buildLoggedIn() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'user@example.com',
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
