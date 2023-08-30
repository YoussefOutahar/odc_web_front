import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../DataBase/Models/blog_post.dart';
import '../../../Services/constants.dart';
import '../../../Services/Utils/responsive.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({super.key});

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  late BlogPost? blogPost;
  late int blogPostId;

  @override
  void initState() {
    Get.parameters['id'] != null
        ? blogPostId = int.parse(Get.parameters['id']!)
        : blogPostId = 5;

    blogPosts.length > blogPostId ? blogPost = blogPosts[blogPostId] : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return blogPost != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 2),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            blogPost!.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDefaultPadding),
                              child: Text(
                                blogPost!.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize:
                                      Responsive.isDesktop(context) ? 32 : 24,
                                  fontFamily: "Raleway",
                                  color: const Color(0xFF191919),
                                  height: 1.3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              blogPost!.createdAt.toDate().toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding * 2.5),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: MarkdownBody(
                                data: blogPost!.content,
                                styleSheet: MarkdownStyleSheet(
                                  p: const TextStyle(
                                    fontFamily: "Raleway",
                                    color: Color(0xFF191919),
                                    height: 1.5,
                                  ),
                                ),
                              )),
                          const SizedBox(height: kDefaultPadding * 2.5),
                          Row(
                            children: [
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
                              // IconButton(
                              //   icon: SvgPicture.asset(
                              //       "assets/icons/feather_share-2.svg"),
                              //   onPressed: () {},
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const Center(child: Text("No blog post found"));
  }
}
