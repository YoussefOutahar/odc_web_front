import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../DataBase/Models/blog_post.dart';

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
        ? Column(
            children: [
              Image.asset(
                blogPost!.image,
                width: 200,
                height: 200,
              ),
              Text(blogPost!.title),
              Text(blogPost!.content),
            ],
          )
        : const Center(child: Text("No blog post found"));
  }
}
