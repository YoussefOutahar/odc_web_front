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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(228, 87, 46, 1).withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
