import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:odc/Services/constants.dart';

class TextSectionText extends StatelessWidget {
  const TextSectionText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: MarkdownBody(
        data: text,
        selectable: true,
        softLineBreak: true,
        styleSheet: MarkdownStyleSheet(
          p: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
