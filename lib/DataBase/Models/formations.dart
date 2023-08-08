class Formation {
  String image, category, title;
  String? uid;

  Formation(
      {this.uid,
      required this.image,
      required this.category,
      required this.title});

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      uid: json['uid'],
      title: json['title'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'category': category,
        'image': image,
      };
}

// Demo List of my works
List<Formation> formations = [
  Formation(
    uid: "9628b977-d840-58c8-8fc4-2ee170c82ca5",
    title: "Formations sur mesures",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img2.png",
  ),
  Formation(
    uid: "d6bf2b48-2218-599f-96cb-6cd8e2fea77f",
    title: "Soft Skills",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img5.png",
  ),
  Formation(
    uid: "4b6a3cb5-7027-59c6-a069-affdaee03f48",
    title: "Formation Doctorant",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img7.png",
  ),
  Formation(
    uid: "a8d189c6-dd6a-56d2-9677-fc7c105cf733",
    title: "Learning Travel",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img10.png",
  ),
];
