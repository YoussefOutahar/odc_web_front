import 'dart:ui';

class Service {
  String? uid;
  String title, image;
  Color color;

  Service(
      {this.uid,
      required this.title,
      required this.image,
      required this.color});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      uid: json['uid'],
      title: json['title'],
      image: json['image'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'image': image,
        'color': color,
      };
}

// For demo list of service
List<Service> services = [
  Service(
    uid: "ab9baa22-eae1-5594-98a7-26968bf32c9f",
    title: "Graphic Design",
    image: "assets/images/graphic.png",
    color: const Color(0xFFD9FFFC),
  ),
  Service(
    uid: "4b1f7e0a-1a86-5aa9-857d-9c750a8dc7db",
    title: "Web Design",
    image: "assets/images/desktop.png",
    color: const Color(0xFFE4FFC7),
  ),
  Service(
    uid: "7b91003c-a30f-5f86-8701-aec312f8e4f3",
    title: "UI Design",
    image: "assets/images/ui.png",
    color: const Color(0xFFFFF3DD),
  ),
  Service(
    uid: "c11786d6-cb62-57f6-b394-32122edcd76d",
    title: "Interaction Design",
    image: "assets/images/Intreaction_design.png",
    color: const Color(0xFFFFE0E0),
  ),
];
