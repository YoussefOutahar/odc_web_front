import 'package:flutter/material.dart';

import '../../Animations/animated_opacity_when_hovered.dart';
import '../../Animations/delayed_widget.dart';
import '../../../Services/Utils/utils.dart';

class SocialMediaButton extends StatelessWidget {
  final String url;
  final IconData iconData;
  final double size;
  final int index;

  const SocialMediaButton({
    required this.url,
    required this.iconData,
    required this.index,
    this.size = 30.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 1500 + ((index + 1) * 125)),
      from: DelayFrom.bottom,
      child: AnimatedOpacityWhenHovered(
        child: Semantics(
          button: true,
          label: "Social Media Button",
          child: IconButton(
            onPressed: () => launchUrl(url),
            icon: Icon(
              iconData,
              color: Colors.black,
              size: size,
            ),
          ),
        ),
      ),
    );
  }
}
