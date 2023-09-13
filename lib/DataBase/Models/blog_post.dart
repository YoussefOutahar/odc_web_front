import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  Future<String> get getImageDownloadlink async {
    String downloadLink;
    downloadLink =
        await FirebaseStorage.instance.ref().child(image).getDownloadURL();
    return downloadLink;
  }

  @override
  String toString() {
    return "BlogPost [uid = $uid, title = $title, content = $content, image = $image, createdAt = $createdAt]";
  }
}

// List<BlogPost> blogPosts = [
//   BlogPost(
//     title: "Our “Secret” Formula to Online Workshops",
//     content:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl.",
//     image: "assets/images/recent_1.png",
//     createdAt: Timestamp.now(),
//   ),
//   BlogPost(
//     title: "Digital Product Innovations from Warsaw with Love",
//     content:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl.",
//     image: "assets/images/recent_2.png",
//     createdAt: Timestamp.now(),
//   ),
//   BlogPost(
//     title: "Our “Secret” Formula to Online Workshops",
//     content:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl."
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non pulvinar tortor. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl. Nulla facilisi. Donec euismod, nisl sed aliquam ultricies, nunc sapien ultricies arcu, eget aliquet quam nisi eget nisl.",
//     image: "assets/images/recent_1.png",
//     createdAt: Timestamp.now(),
//   ),
// ];
