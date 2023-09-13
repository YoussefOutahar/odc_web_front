import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../DataBase/Controllers/blog_controller.dart';
import '../../../DataBase/Models/blog_post.dart';
import '../../../Services/constants.dart';
import '../../../Services/Utils/responsive.dart';
import '../../../translations/locale_keys.g.dart';
import 'Components/blog_post_card.dart';
import 'Components/recent_posts.dart';
import 'Components/sidebar_container.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController(
      text: '',
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(searchController.text);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: Responsive.isDesktop(context)
                ? const EdgeInsets.only(
                    left: kDefaultPadding * 2,
                    right: kDefaultPadding * 2,
                  )
                : const EdgeInsets.only(
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
            child: StreamBuilder<List<BlogPost>>(
              stream: BlogController.getBlogPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BlogPost> data = snapshot.data!;
                  List<BlogPost> filteredData = data;

                  // filter data based on searchController
                  if (searchController.text.isNotEmpty) {
                    filteredData = data
                        .where((element) => element.title
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .toList();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      return BlogPostCard(blogPost: filteredData[index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        if (Responsive.isDesktop(context))
          Expanded(
            child: Padding(
              padding: Responsive.isDesktop(context)
                  ? const EdgeInsets.only(
                      left: kDefaultPadding * 2,
                      right: kDefaultPadding * 2,
                    )
                  : const EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
              child: Column(
                children: [
                  SidebarContainer(
                    title: LocaleKeys.blog_page_search_title.tr(),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {},
                      onSubmitted: (value) => setState(() {
                        searchController.text = value;
                      }),
                      decoration: InputDecoration(
                        hintText: LocaleKeys.blog_page_search_hint.tr(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding / 2),
                          child: SvgPicture.asset(
                              "assets/icons/feather_search.svg"),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kDefaultPadding / 2),
                          ),
                          borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  // Categories(),
                  const SizedBox(height: kDefaultPadding),
                  const RecentPosts(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
