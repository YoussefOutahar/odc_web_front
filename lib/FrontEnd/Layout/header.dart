import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';

import '../../Services/Utils/responsive.dart';
import '../../translations/locale_keys.g.dart';
import '../Animations/delayed_widget.dart';
import '../Components/optima_logo.dart';
import 'Components/globe_drop_down_menu.dart';
import 'Components/tab_tile.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.openDrawer, required this.showLogo});

  final VoidCallback openDrawer;
  final bool showLogo;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Container(
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
                          child: Semantics(
                            label: LocaleKeys.tab_tiles_home.tr(),
                            child:
                                TabTile(text: LocaleKeys.tab_tiles_home.tr(), onTap: () => Get.offAndToNamed("/home")),
                          ),
                        ),
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 900),
                          child: Semantics(
                            label: LocaleKeys.tab_tiles_about.tr(),
                            child: TabTile(text: LocaleKeys.tab_tiles_about.tr(), onTap: () => Get.toNamed("/aboutUs")),
                          ),
                        ),
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 1000),
                          child: Semantics(
                            label: LocaleKeys.tab_tiles_formation.tr(),
                            child: TabTile(
                                text: LocaleKeys.tab_tiles_formation.tr(), onTap: () => Get.toNamed("/formations")),
                          ),
                        ),
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 1100),
                          child: Semantics(
                            label: LocaleKeys.tab_tiles_conseils.tr(),
                            child: TabTile(
                                text: LocaleKeys.tab_tiles_conseils.tr(), onTap: () => Get.toNamed("/conseils")),
                          ),
                        ),
                        DelayedWidget(
                          delayDuration: const Duration(milliseconds: 1100),
                          child: Semantics(
                            label: LocaleKeys.tab_tiles_blog.tr(),
                            child: TabTile(text: LocaleKeys.tab_tiles_blog.tr(), onTap: () => Get.toNamed("/blog")),
                          ),
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
                if (widget.showLogo)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Hero(
                      tag: "logo",
                      child: OptimaDecisionLogo(),
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
                        child: Semantics(
                          label: LocaleKeys.tab_tiles_contact_us.tr(),
                          child: ElevatedButton(
                              onPressed: () => Get.toNamed("/contactUs"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: Text(LocaleKeys.tab_tiles_contact_us.tr())),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
