import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../DataBase/Models/blog_post.dart';

class BlogPostCard extends StatefulWidget {
  const BlogPostCard({super.key, required this.blogPost});

  final BlogPost blogPost;

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  bool isHover = false;
  Duration duration = const Duration(milliseconds: 200);

  String? imageUrl;

  @override
  void initState() {
    loadImageUrl();
    super.initState();
  }

  Future<void> loadImageUrl() async {
    String downloadUrl = await FirebaseStorage.instance
        .ref(widget.blogPost.image)
        .getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: [
            if (isHover)
              BoxShadow(
                offset: const Offset(0, 20),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.1),
              )
          ],
        ),
        child: Card(
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageUrl != null
                        ? SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const CircularProgressIndicator(),
                    const SizedBox(height: 60),
                    Text(
                      widget.blogPost.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text.rich(
                    TextSpan(
                      text: "Know more about ",
                      children: [
                        TextSpan(
                          text: "me",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
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
