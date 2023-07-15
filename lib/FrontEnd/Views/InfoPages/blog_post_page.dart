import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../DataBase/Models/blog_post.dart';
import '../../../Services/constants.dart';
import '../../../Services/responsive.dart';

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
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    blogPost!.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                      Row(
                        children: [
                          Text(
                            "Design".toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xFF191919),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: kDefaultPadding),
                          Text(
                            blogPost!.createdAt.toDate().toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        child: Text(
                          blogPost!.title,
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
                      Text(
                        blogPost!.content,
                        maxLines: 4,
                        style: const TextStyle(height: 1.5),
                      ),
                      const SizedBox(height: kDefaultPadding),
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
          )
        : const Center(child: Text("No blog post found"));
  }
}
