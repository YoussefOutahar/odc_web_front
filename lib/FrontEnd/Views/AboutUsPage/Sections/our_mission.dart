import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';

class OurMission extends StatelessWidget {
  const OurMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_our_mission.tr(),
              subTitle: "",
              color: Colors.orange),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Image.asset("assets/images/text/description1.png"),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Image.asset("assets/images/text/description2.png"),
          ),
          const SizedBox(height: kDefaultPadding),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Image.asset("assets/images/text/description3.png"),
          ),
        ],
      ),
    );
  }
}
