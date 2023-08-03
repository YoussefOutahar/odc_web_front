import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ConseilsPage extends StatelessWidget {
  const ConseilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollTransformView(
      children: [
        ScrollTransformItem(builder: (scroll) {
          return const SizedBox();
        })
      ],
    );
  }
}
