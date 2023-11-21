import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        PopupMenuItem<String>(
          value: 'english',
          child: Semantics(
            label: 'English',
            child: const Text('English'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'french',
          child: Semantics(
            label: 'French',
            child: const Text('French'),
          ),
        ),
      ],
    );
  }
}
