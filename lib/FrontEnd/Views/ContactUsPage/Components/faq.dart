import 'package:flutter/material.dart';
import 'package:odc/FrontEnd/Views/ContactUsPage/Components/faq_title.dart';

import 'faq_text.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Frequently Asked Questions",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        FAQTitle(title: "What is the ODC?"),
        FAQText(
            text:
                "The ODC is a student-run organization that aims to provide students with the opportunity to gain real-world experience in the field of software development. We do this by working on projects for real clients, and by providing students with the opportunity to work on projects that they are passionate about."),
      ],
    );
  }
}
