import 'package:flutter/material.dart';

import '../Animations/animated_opacity_when_hovered.dart';

class ScrollUpIndicator extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollUpIndicator(this.scrollController, {super.key});

  @override
  State<ScrollUpIndicator> createState() => _ScrollUpIndicatorState();
}

class _ScrollUpIndicatorState extends State<ScrollUpIndicator> {
  late bool _visible = false;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final offset = widget.scrollController.offset;

      if (offset > 360.0) {
        if (!_visible) setState(() => _visible = true);
      } else if (offset <= 360.0) {
        if (_visible) setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: _visible
          ? GestureDetector(
              onTap: () {
                widget.scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.ease,
                );
              },
              child: const MouseRegion(
                cursor: SystemMouseCursors.click,
                child: AnimatedOpacityWhenHovered(
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
