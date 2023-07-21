import 'package:flutter/material.dart';

class TextSectionText extends StatelessWidget {
  const TextSectionText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
