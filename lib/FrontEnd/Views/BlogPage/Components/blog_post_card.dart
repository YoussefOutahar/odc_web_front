import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../DataBase/Models/blog_post.dart';
import '../../../../Services/constants.dart';
import '../../../../Services/Utils/responsive.dart';
import '../../../../translations/locale_keys.g.dart';

class BlogPostCard extends StatelessWidget {
  final BlogPost blogPost;
  const BlogPostCard({
    Key? key,
    required this.blogPost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.asset(
              blogPost.image,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blogPost.createdAt.toDate().toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      blogPost.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 32 : 24,
                        fontFamily: "Raleway",
                        color: const Color(0xFF191919),
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MarkdownBody(
                      data: "${blogPost.content.substring(0, 300)}...",
                      selectable: true,
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          blogPosts.contains(blogPost)
                              ? Get.toNamed(
                                  "/blogPost/${blogPosts.indexOf(blogPost)}")
                              : null;
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              bottom: kDefaultPadding / 4),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: kPrimaryColor, width: 3),
                            ),
                          ),
                          child: Text(
                            LocaleKeys.blog_page_read_more.tr(),
                            style: const TextStyle(color: Color(0xFF191919)),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/feather_thumbs-up.svg"),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/feather_message-square.svg"),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                            "assets/icons/feather_share-2.svg"),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
