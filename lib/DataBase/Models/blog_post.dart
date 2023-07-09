import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPost {
  String? uid;
  String title;
  String content;
  String image;
  Timestamp createdAt;

  BlogPost({
    this.uid,
    required this.title,
    required this.content,
    required this.image,
    required this.createdAt,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      uid: json['uid'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'content': content,
      'image': image,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return "BlogPost [uid = $uid, title = $title, content = $content, image = $image, createdAt = $createdAt]";
  }
}
