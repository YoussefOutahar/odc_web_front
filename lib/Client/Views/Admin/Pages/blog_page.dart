import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../DataBase/Controllers/blog_controller.dart';
import '../../../../DataBase/Models/blog_post.dart';
import '../Components/Blog/blog_data.dart';
import '../Components/Blog/blog_post_card.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  Widget? currentView;

  @override
  void initState() {
    currentView = _buildBlogListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentView ?? const Center(child: CircularProgressIndicator());
  }

  Widget _buildBlogListView() => StreamBuilder<List<BlogPost>>(
        stream: BlogController.getBlogPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    for (int i = 0; i < snapshot.data!.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlogPostCard(blogPost: snapshot.data![i]),
                      ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        currentView = _buildAddBlogView();
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

  Widget _buildAddBlogView() => Stack(
        children: [
          BlogData(
            blogPost: BlogPost(
              uid: '',
              title: '',
              content: '',
              image: '',
              createdAt: Timestamp.now(),
            ),
            onCanceled: () => setState(() {
              currentView = _buildBlogListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildBlogListView();
                  });
                },
              ),
            ),
          ),
        ],
      );

  Widget _buildEditBlogView(BlogPost blogPost) => Stack(
        children: [
          BlogData(
            blogPost: blogPost,
            onCanceled: () => setState(() {
              currentView = _buildBlogListView();
            }),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentView = _buildBlogListView();
                  });
                },
              ),
            ),
          ),
        ],
      );
}
