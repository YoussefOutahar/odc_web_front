import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tab_tile.dart';

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
        ],
      ),
    );
  }
}
