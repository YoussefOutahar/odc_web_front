import 'package:flutter/material.dart';
import 'package:tap_to_expand/tap_to_expand.dart';

import 'text_section_text.dart';
import 'text_section_title.dart';

class FoldedTextCard extends StatefulWidget {
  const FoldedTextCard({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  State<FoldedTextCard> createState() => _FoldedTextCardState();
}

class _FoldedTextCardState extends State<FoldedTextCard> {
  @override
  Widget build(BuildContext context) {
    return TapToExpand(
      color: Colors.white,
      scrollable: true,
      borderRadius: 5,
      openedHeight: 500,
      duration: const Duration(milliseconds: 800),
      onTapPadding: 20,
      scrollPhysics: const BouncingScrollPhysics(),
      content: Center(
        child: TextSectionText(
          text: widget.text,
        ),
      ),
      title: TextSectionTitle(
        title: widget.title,
      ),
      trailing: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
      ),
    );
  }
}
