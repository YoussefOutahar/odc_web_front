import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../DataBase/Models/blog_post.dart';
import '../../../../Services/image_service.dart';
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
  late List<Future<String>> imageLinkFutures;

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
            imageLinkFutures = blogPosts.map((e) => e.getImageDownloadlink).toList();
            return ListView.builder(
              itemCount: blogPosts.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(kDefaultPadding),
              itemBuilder: (context, index) => FutureBuilder<String>(
                future: imageLinkFutures[index],
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RecentPostCard(
                      image: snapshot.data as String,
                      title: blogPosts[index].title,
                      press: () {
                        Get.toNamed("/blogPost/${blogPosts[index].uid}");
                      },
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
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 4),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CachedImageManager(
                    imageUrl: image,
                  ),
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
      ),
    );
  }
}
