import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';
import '../Components/about_us_text.dart';

class Formations extends StatelessWidget {
  const Formations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[3],
            title: LocaleKeys.about_page_title_formations.tr(),
            subTitle: "",
          ),
          AboutUsText(text: LocaleKeys.about_page_text_formations.tr()),
        ],
      ),
    );
  }
}
