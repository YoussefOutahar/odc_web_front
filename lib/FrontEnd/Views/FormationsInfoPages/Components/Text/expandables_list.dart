import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:odc/FrontEnd/Views/FormationsInfoPages/Components/Text/text_section_text.dart';
import 'package:odc/Services/constants.dart';

class ExpandablesList extends StatelessWidget {
  const ExpandablesList({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
            children: data.entries
                .map((e) => ExpandablePanel(
                      theme: const ExpandableThemeData(
                        hasIcon: false,
                        useInkWell: false,
                      ),
                      header: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandableHeader(name: e.key),
                      ),
                      collapsed: const SizedBox.shrink(),
                      expanded: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextSectionText(text: e.value),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class ExpandableHeader extends StatefulWidget {
  const ExpandableHeader({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<ExpandableHeader> createState() => _ExpandableHeaderState();
}

class _ExpandableHeaderState extends State<ExpandableHeader> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "+  ${widget.name}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPadding / 4),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: _isHovering ? 100 : 0,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(4)),
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
