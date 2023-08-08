import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:odc/Services/constants.dart';

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
    return ExpandablePanel(
      theme: const ExpandableThemeData(
          tapBodyToCollapse: true,
          iconPadding: EdgeInsets.all(kDefaultPadding)),
      header: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: TextSectionTitle(
          title: widget.title,
        ),
      ),
      collapsed: const SizedBox.shrink(),
      expanded: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Center(
          child: MarkdownBody(
            data: widget.text,
            selectable: true,
            softLineBreak: true,
            styleSheet: MarkdownStyleSheet(
              textAlign: WrapAlignment.center,
              p: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
    // return TapToExpand(
    //   color: Colors.white,
    //   scrollable: true,
    //   borderRadius: 5,
    //   openedHeight: 500,
    //   duration: const Duration(milliseconds: 800),
    //   onTapPadding: 20,
    //   scrollPhysics: const BouncingScrollPhysics(),
    //   content: TextSectionText(
    //     text: widget.text,
    //   ),
    //   title: TextSectionTitle(
    //     title: widget.title,
    //   ),
    //   trailing: const Icon(
    //     Icons.arrow_drop_down,
    //     color: Colors.black,
    //   ),
    // );
  }
}
