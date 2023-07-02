import 'package:flutter/material.dart';

import '../../footer.dart';
import '../../header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child});

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

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60; // Minimum height of the header
  @override
  double get maxExtent => 60; // Maximum height of the header

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return const Header();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
