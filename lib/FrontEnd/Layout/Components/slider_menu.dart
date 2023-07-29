import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../translations/locale_keys.g.dart';
import 'globe_drop_down_menu.dart';
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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
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
                  TabTile(
                      text: LocaleKeys.tab_tiles_home.tr(),
                      onTap: () => Get.offAndToNamed("/home")),
                  TabTile(
                      text: LocaleKeys.tab_tiles_about.tr(),
                      onTap: () => Get.toNamed("/aboutUs")),
                  TabTile(
                      text: LocaleKeys.tab_tiles_formation.tr(),
                      onTap: () => Get.toNamed("/formations")),
                  TabTile(
                      text: LocaleKeys.tab_tiles_blog.tr(),
                      onTap: () => Get.toNamed("/blog")),
                  TabTile(
                      text: LocaleKeys.tab_tiles_conseils.tr(),
                      onTap: () => Get.toNamed("/conseils")),
                  TabTile(
                      text: LocaleKeys.tab_tiles_contact_us.tr(),
                      onTap: () => Get.toNamed("/contactUs")),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GlobeDropdownMenu(),
              ),
            )
          ],
        ));
  }
}
