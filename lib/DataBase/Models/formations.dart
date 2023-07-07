class Formation {
  final String image, category, title;
  final int id;

  Formation(
      {required this.id,
      required this.image,
      required this.category,
      required this.title});

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'image': image,
      };
}

// Demo List of my works
List<Formation> formations = [
  Formation(
    id: 1,
    title: "Formations sur mesures",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img1.png",
  ),
  Formation(
    id: 2,
    title: "Soft Skills",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img2.png",
  ),
  Formation(
    id: 3,
    title: "Formation Doctorant",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img3.png",
  ),
  Formation(
    id: 4,
    title: "Learning Travel",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img9.png",
  ),
];
