import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../../../DataBase/Models/blog_post.dart';
import '../../../../../Services/image_service.dart';
import '../../../../../Services/constants.dart';
import '../../../../../Services/Utils/responsive.dart';

class BlogPostCard extends StatefulWidget {
  const BlogPostCard({super.key, required this.blogPost, required this.onDeleted, required this.onModified});

  final BlogPost blogPost;
  final VoidCallback onDeleted;
  final VoidCallback onModified;

  @override
  State<BlogPostCard> createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  String? imageUrl;

  @override
  void initState() {
    loadImageUrl();
    super.initState();
  }

  Future<void> loadImageUrl() async {
    String downloadUrl = await FirebaseStorage.instance.ref(widget.blogPost.image).getDownloadURL();
    setState(() {
      imageUrl = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              // offset: const Offset(0, 20),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        height: 500,
        width: 400,
        child: Column(
          children: [
            AspectRatio(
                aspectRatio: 1.78,
                child: imageUrl != null
                    ? CachedImageManager(imageUrl: imageUrl)
                    : const Center(child: CircularProgressIndicator())),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      widget.blogPost.title,
                      textAlign: TextAlign.center,
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
                    widget.blogPost.content,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1.5),
                  ),
                  const SizedBox(height: kDefaultPadding * 4),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: widget.onModified,
                            child: const Text("Modify"),
                          ),
                          const SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: widget.onDeleted,
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        widget.blogPost.createdAt.toDate().toString(),
                        style: Theme.of(context).textTheme.bodySmall,
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
