import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';

class OurValues extends StatefulWidget {
  const OurValues({super.key});

  @override
  State<OurValues> createState() => _OurValuesState();
}

class _OurValuesState extends State<OurValues> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(title: LocaleKeys.about_page_title_our_values.tr(), subTitle: "", color: kAppColors[2]),
          const SizedBox(
            height: 40,
          ),
          Wrap(
            spacing: 60,
            runSpacing: 60,
            children: [
              buildValueBubble(1, LocaleKeys.about_page_text_our_values_1.tr()),
              buildValueBubble(2, LocaleKeys.about_page_text_our_values_2.tr()),
              buildValueBubble(3, LocaleKeys.about_page_text_our_values_3.tr()),
              buildValueBubble(4, LocaleKeys.about_page_text_our_values_4.tr()),
              buildValueBubble(5, LocaleKeys.about_page_text_our_values_5.tr()),
            ],
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }

  Widget buildValueBubble(int index, String valueName) => Column(
        children: [
          // Roudned red Container with index
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                index.toString(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            valueName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      );
}
