import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobeDropdownMenu extends StatelessWidget {
  const GlobeDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.language),
      tooltip: "Change Language",
      onSelected: (String language) async {
        if (language == 'english') {
          await context.setLocale(const Locale('en'));
          Get.updateLocale(const Locale('en'));
        } else if (language == 'french') {
          await context.setLocale(const Locale('fr'));
          Get.updateLocale(const Locale('fr'));
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'english',
          child: Text('English'),
        ),
        const PopupMenuItem<String>(
          value: 'french',
          child: Text('French'),
        ),
      ],
    );
  }
}
