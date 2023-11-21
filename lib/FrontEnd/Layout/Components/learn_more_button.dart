import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../Animations/delayed_widget.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: const Duration(milliseconds: 1500),
      from: DelayFrom.bottom,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Semantics(
          label: "Learn more about Optima Decision",
          button: true,
          child: InkWell(
            onTap: () => Get.toNamed("/aboutUs"),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
