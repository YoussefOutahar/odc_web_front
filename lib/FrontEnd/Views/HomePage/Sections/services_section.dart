import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:odc/translations/locale_keys.g.dart';

import '../../../../DataBase/Models/service.dart';
import '../../../../Services/constants.dart';
import '../../../Components/section_title.dart';
import '../Components/service_card.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 * 2),
      child: Column(
        children: [
          SectionTitle(
            color: kAppColors[2],
            title: LocaleKeys.home_page_title_conseils.tr(),
            subTitle: LocaleKeys.home_page_subtitle_conseils.tr(),
          ),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 10,
              children: List.generate(services.length, (index) => ServiceCard(index: index)),
            ),
          )
        ],
      ),
    );
  }
}
