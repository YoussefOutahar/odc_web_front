import 'package:flutter/material.dart';

import '../../footer.dart';
import '../../header.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          forceMaterialTransparency: true,
          floating: true,
          flexibleSpace: Header(),
        ),
        SliverToBoxAdapter(
          child: child,
        ),
        const SliverToBoxAdapter(
          child: Footer(),
        ),
      ],
    );
  }
}
