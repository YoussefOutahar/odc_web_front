import 'package:flutter/material.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/text_section_text.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/text_section_title.dart';

class TextCard extends StatelessWidget {
  const TextCard({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextSectionTitle(title: title),
              const SizedBox(height: 10),
              TextSectionText(text: text),
            ],
          ),
        ),
      ),
    );
  }
}
