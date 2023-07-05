import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:odc_web_front/Core/footer.dart';

import 'tab_tile.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key, required this.child});

  final Widget child;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _key,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _key.currentState!.toggle();
            },
          ),
        ),
        slider: Container(
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
              const SizedBox(height: 20.0),
              TabTile(text: "Home", onTap: () => Get.offAndToNamed("/home")),
              TabTile(text: "About", onTap: () => Get.toNamed("/aboutUs")),
              TabTile(
                  text: "Formations", onTap: () => Get.toNamed("/formations")),
              TabTile(
                  text: "Contact Us", onTap: () => Get.toNamed("/contactUs")),
              const SizedBox(height: 20.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: const Column(
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [widget.child, const Footer()],
        )),
      ),
    );
  }
}
