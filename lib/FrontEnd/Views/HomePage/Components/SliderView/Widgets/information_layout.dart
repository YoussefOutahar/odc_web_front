import 'package:flutter/material.dart';
import 'package:odc/Services/constants.dart';

import '../../../../../../DataBase/Models/events.dart';
import 'arrow_button.dart';
import 'information_card.dart';

class InformationLayout extends StatefulWidget {
  final Function() previousArrowEvent;
  final Function() nextArrowEvent;
  final List<Event> data;
  final PageController pageController;
  const InformationLayout({
    Key? key,
    required this.previousArrowEvent,
    required this.nextArrowEvent,
    required this.data,
    required this.pageController,
  }) : super(key: key);

  @override
  State<InformationLayout> createState() => _InformationLayoutState();
}

class _InformationLayoutState extends State<InformationLayout> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Row(
        children: [
          ArrowButton(
            isHover: isHover,
            icon: Icons.chevron_left,
            onTap: widget.previousArrowEvent,
          ),
          const SizedBox(width: kDefaultPadding * 2),
          Expanded(
            child: PageView.builder(
              itemCount: widget.data.length,
              controller: widget.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (v) {
                setState(() {});
              },
              itemBuilder: (context, i) {
                // return EventCard(event: widget.data[i]);
                return InformationCardTile(data: widget.data[i]);
              },
            ),
          ),
          const SizedBox(width: kDefaultPadding * 2),
          ArrowButton(
            isHover: isHover,
            icon: Icons.chevron_right,
            onTap: widget.nextArrowEvent,
          ),
        ],
      ),
    );
  }
}
