class TeamMember {
  final String name;
  final String role;
  final String image;

  TeamMember({required this.name, required this.role, required this.image});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      name: json['name'],
      role: json['role'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'role': role,
        'image': image,
      };
}

List<TeamMember> members = [
  TeamMember(
    name: "K. El Yassini",
    role: "President",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "K. OUFASKA",
    role: "Vice présidente coopération & relations internationales",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "R. Benarri",
    role: "Vice président recherche & développement",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "M. El Youssfi",
    role: "Vice président business developement",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "B. Igouzoul",
    role: "Contrôle, Audit & Qualité",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "A. HAIBI  B. ELGHAZI",
    role: "Innovation & Valorisation",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "H.EL YASSINI",
    role: "Direction études et conseil",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "M.EL YASSINI",
    role: "Direction études et conseil",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: " K. INNOURI",
    role: "Cellule Experts R & D",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: " J. MNINOU",
    role: "Cellule Experts R & D",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "I. MNINOU",
    role: "Cellule Experts R & D",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "F. SOSSI ALAOUI",
    role: "Cellule Experts R & D",
    image: "assets/images/ceo.png",
  ),
  TeamMember(
    name: "B. GENNOUN",
    role: "Cellule Experts R & D",
    image: "assets/images/ceo.png",
  ),
];
