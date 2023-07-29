import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../Components/section_title.dart';

class OurValues extends StatefulWidget {
  const OurValues({super.key});

  @override
  State<OurValues> createState() => _OurValuesState();
}

class _OurValuesState extends State<OurValues> {
  final List<String> values = [
    "Ecoute",
    "Innovation",
    "Transparence",
    "Engagement",
    "Intégrité"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Column(
        children: [
          SectionTitle(
              title: LocaleKeys.about_page_our_values.tr(),
              subTitle: "",
              color: Colors.orange),
          const SizedBox(
            height: 40,
          ),
          Wrap(
            spacing: 60,
            runSpacing: 60,
            children: values
                .map((e) => Column(
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
                              (values.indexOf(e) + 1).toString(),
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          e,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ))
                .toList(),
          ),
          const SizedBox(height: 20 * 3),
        ],
      ),
    );
  }
}
