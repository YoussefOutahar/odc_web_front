import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../DataBase/Models/blog_post.dart';
import '../../../../Services/constants.dart';
import '../../../../translations/locale_keys.g.dart';
import 'sidebar_container.dart';

class RecentPosts extends StatefulWidget {
  const RecentPosts({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  late Future<List<BlogPost>> recentBlogPosts;

  @override
  void initState() {
    recentBlogPosts = BlogController.getBlogPostsFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: LocaleKeys.blog_page_recent_posts.tr(),
      child: FutureBuilder(
        future: recentBlogPosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<BlogPost> blogPosts = snapshot.data as List<BlogPost>;
            return ListView.builder(
              itemCount: blogPosts.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(kDefaultPadding),
              itemBuilder: (context, index) => FutureBuilder<String>(
                future: blogPosts[index].getImageDownloadlink,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RecentPostCard(
                      image: snapshot.data as String,
                      title: blogPosts[index].title,
                      press: () {},
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class RecentPostCard extends StatelessWidget {
  final String image, title;
  final VoidCallback press;

  const RecentPostCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: kDefaultPadding),
            Expanded(
              flex: 5,
              child: Text(
                title,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: "Raleway",
                  color: kDarkBlackColor,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
