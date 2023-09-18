import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';

class WhoAreWe extends StatelessWidget {
  const WhoAreWe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(title: LocaleKeys.about_page_title_who_are_we.tr(), subTitle: "", color: kAppColors[0]),
          const SizedBox(height: 20 * 3),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Text(
              LocaleKeys.about_page_text_who_are_we.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}
