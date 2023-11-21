import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptimaDecisionLogo extends StatelessWidget {
  const OptimaDecisionLogo({super.key, this.height = 50.0});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Optima Decision Logo",
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => Get.offAndToNamed("/home"),
          child: Image.asset(
            'assets/images/logo_no_text.png',
            height: height,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}
