import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../Services/Utils/responsive.dart';
import '../../../../translations/locale_keys.g.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Responsive.isMobile(context)) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20 * 2),
        padding: const EdgeInsets.symmetric(horizontal: 20 * 2),
        constraints: const BoxConstraints(maxWidth: 1110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.home_page_title_about_us.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            AboutSectionText(
              text: LocaleKeys.home_page_about_us_text.tr(),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20 * 2),
        padding: const EdgeInsets.symmetric(horizontal: 20 * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.home_page_title_about_us.tr(),
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              width: size.width / 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: AboutSectionText(
                  text: LocaleKeys.home_page_about_us_text.tr()),
            ),
          ],
        ),
      );
    }
  }
}

class AboutSectionText extends StatelessWidget {
  const AboutSectionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.normal, color: Colors.black, height: 1.5),
      ),
    );
  }
}
