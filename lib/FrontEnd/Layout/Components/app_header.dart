import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../translations/locale_keys.g.dart';
import '../../Animations/delayed_widget.dart';
import 'header_type.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.type,
  });

  final HeaderType type;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (type == HeaderType.header) {
      return Container(
        width: size.width,
        height: size.height,
        color: const Color.fromRGBO(228, 87, 46, 1),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/odc_pattern5.png",
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedWidget(
                    delayDuration: const Duration(milliseconds: 500),
                    from: DelayFrom.bottom,
                    child: SelectableText(
                      LocaleKeys.website_name.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  DelayedWidget(
                    delayDuration: const Duration(milliseconds: 800),
                    from: DelayFrom.bottom,
                    child: SelectableText(
                      LocaleKeys.website_subtitle.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else if (type == HeaderType.compactHeader) {
      return Container(
        width: size.width,
        height: size.height / 2.5,
        color: const Color.fromRGBO(228, 87, 46, 1),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                "assets/images/odc_pattern5.png",
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DelayedWidget(
                    delayDuration: const Duration(milliseconds: 500),
                    from: DelayFrom.bottom,
                    child: SelectableText(
                      LocaleKeys.website_name.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
