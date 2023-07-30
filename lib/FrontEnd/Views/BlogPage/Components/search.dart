import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import 'sidebar_container.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: LocaleKeys.blog_page_search_title.tr(),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: LocaleKeys.blog_page_search_hint.tr(),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: SvgPicture.asset("assets/icons/feather_search.svg"),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(kDefaultPadding / 2),
            ),
            borderSide: BorderSide(color: Color(0xFFCCCCCC)),
          ),
        ),
      ),
    );
  }
}
