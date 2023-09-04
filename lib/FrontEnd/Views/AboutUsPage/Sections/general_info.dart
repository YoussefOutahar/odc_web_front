import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';
import '../Components/about_us_text.dart';
import '../Components/about_us_title.dart';

class GeneralInfo extends StatelessWidget {
  const GeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_title_what_we_do.tr(),
              subTitle: "",
              color: Colors.blueGrey),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_1_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_1_text.tr(),
          ),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_2_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_2_text.tr(),
          ),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_3_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_3_text.tr(),
          ),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_4_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_4_text.tr(),
          ),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_5_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_5_text.tr(),
          ),
          const SizedBox(height: 20 * 3),
          AboutUsTitle(
            title: LocaleKeys.about_page_text_what_we_do_6_title.tr(),
          ),
          AboutUsText(
            text: LocaleKeys.about_page_text_what_we_do_6_text.tr(),
          ),
        ],
      ),
    );
  }
}
