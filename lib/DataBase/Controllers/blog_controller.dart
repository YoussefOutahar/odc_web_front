import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/blog_post.dart';

class BlogController {
  //Create:
  static Future<BlogPost?> addBlogPost(BlogPost blogPost) async {
    try {
      await FirebaseFirestore.instance
          .collection('BlogPosts')
          .doc()
          .set(blogPost.toJson());

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection("BlogPosts")
              .where("title", isEqualTo: blogPost.title)
              .where("content", isEqualTo: blogPost.content)
              .where("image", isEqualTo: blogPost.image)
              .get();

      final String uid = snapshot.docs.first.id;
      await FirebaseFirestore.instance
          .collection('BlogPosts')
          .doc(uid)
          .update({"uid": uid});

      blogPost.uid = uid;
      return blogPost;
    } catch (e) {
      return null;
    }
  }

  //Read:
  Future<BlogPost?> getBlogPost(String uid) async {
    DocumentSnapshot? document;
    try {
      document = await FirebaseFirestore.instance
          .collection('BlogPosts')
          .doc(uid)
          .get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return BlogPost.fromJson(document.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Stream<List<BlogPost>> getBlogPosts() {
    try {
      return FirebaseFirestore.instance.collection('BlogPosts').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => BlogPost.fromJson(document.data()))
              .toList());
    } catch (e) {
      debugPrint(e.toString());
      return const Stream.empty();
    }
  }

  //Update:
  static Future<bool> updateBlogPost(BlogPost blogPost) async {
    try {
      await FirebaseFirestore.instance
          .collection('BlogPosts')
          .doc(blogPost.uid)
          .update(blogPost.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Delete:
  static Future<bool> deleteBlogPost(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('BlogPosts')
          .doc(uid)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
