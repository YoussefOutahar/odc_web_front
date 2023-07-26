import 'package:flutter/material.dart';

import '../../../DataBase/Models/blog_post.dart';
import '../../../Services/constants.dart';
import '../../../Services/Utils/responsive.dart';
import 'Components/blog_post_card.dart';
import 'Components/categories.dart';
import 'Components/recent_posts.dart';
import 'Components/search.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(
              blogPosts.length,
              (index) => BlogPostCard(blogPost: blogPosts[index]),
            ),
          ),
        ),
        if (!Responsive.isMobile(context))
          const SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          const Expanded(
            child: Column(
              children: [
                Search(),
                SizedBox(height: kDefaultPadding),
                Categories(),
                SizedBox(height: kDefaultPadding),
                RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
