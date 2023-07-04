class Formations {
  final String image, category, title;
  final int id;

  Formations(
      {required this.id,
      required this.image,
      required this.category,
      required this.title});
}

// Demo List of my works
List<Formations> formations = [
  Formations(
    id: 1,
    title: "Formations sur mesures",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img1.png",
  ),
  Formations(
    id: 2,
    title: "Soft Skills",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img2.png",
  ),
  Formations(
    id: 3,
    title: "Formation Doctorant",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img3.png",
  ),
  Formations(
    id: 4,
    title: "Learning Travel",
    category: "Formation",
    image: "assets/images/OpenSourceImages/img9.png",
  ),
];
