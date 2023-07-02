import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Components/desktop_layout.dart';
import 'Components/mobile_layout.dart';
import 'Components/tablet_layout.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key, required this.page});
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Scaffold(
            body: DesktopLayout(
              child: page,
            ),
          );
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            body: TabletLayout(
              child: page,
            ),
          );
        }
        return MobileLayout(
          child: page,
        );
      },
    );
  }
}
