import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/Utils/responsive.dart';
import '../Animations/delayed_widget.dart';
import 'Components/globe_drop_down_menu.dart';
import 'Components/tab_tile.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          !Responsive.isMobile(context)
              ? Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 800),
                        child: TabTile(
                            text: "Home",
                            onTap: () => Get.offAndToNamed("/home")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 900),
                        child: TabTile(
                            text: "About",
                            onTap: () => Get.toNamed("/aboutUs")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 1000),
                        child: TabTile(
                            text: "Formations",
                            onTap: () => Get.toNamed("/formations")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 1100),
                        child: TabTile(
                            text: "Conseils",
                            onTap: () => Get.toNamed("/conseils")),
                      ),
                      DelayedWidget(
                        delayDuration: const Duration(milliseconds: 1100),
                        child: TabTile(
                            text: "Blog", onTap: () => Get.toNamed("/blog")),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Responsive.isMobile(context)
                  ? IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: widget.openDrawer,
                      icon: const Icon(Icons.menu),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Get.offAndToNamed("/home"),
                    child: Image.asset(
                      'assets/images/logo_no_text.png',
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: GlobeDropdownMenu(),
                    )
                  : const SizedBox.shrink(),
              Responsive.isDesktop(context) || Responsive.isTablet(context)
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ElevatedButton(
                          onPressed: () => Get.toNamed("/contactUs"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text("Let's Talk")),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
