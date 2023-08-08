import 'package:flutter/material.dart';

import '../../../../Services/constants.dart';

class AboutUsText extends StatelessWidget {
  const AboutUsText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1110),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20 * 3),
          ],
        ),
      ),
    );
  }
}
