import 'package:flutter/material.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_section_text.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_section_title.dart';

import '../../../../../Services/constants.dart';

class TextCard extends StatelessWidget {
  const TextCard({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextSectionTitle(title: title),
          ),
          const Divider(
            endIndent: kDefaultPadding,
            indent: kDefaultPadding,
          ),
          const SizedBox(height: kDefaultPadding * 2),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding * 2),
            child: TextSectionText(text: text),
          ),
        ],
      ),
    );
  }
}
