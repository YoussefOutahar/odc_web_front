import 'package:flutter/material.dart';

import '../../../../../Services/constants.dart';
import 'sections/messages_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: kDefaultPadding),
        Text(
          "Home Page",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        Divider(),
        SizedBox(height: kDefaultPadding / 2),
        MessagesSection(),
        SizedBox(height: kDefaultPadding / 2),
        Divider(),
        SizedBox(height: kDefaultPadding / 2),
      ],
    );
  }
}
