import 'package:firebase_storage/firebase_storage.dart';

class TeamMember {
  String? uid;
  String name;
  String role;
  String image;
  String pdfUrl;

  TeamMember(
      {this.uid,
      required this.name,
      required this.role,
      required this.image,
      required this.pdfUrl});

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      uid: json['uid'],
      name: json['name'],
      role: json['role'],
      image: json['image'],
      pdfUrl: json['pdfUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'role': role,
        'image': image,
        'pdfUrl': pdfUrl,
      };

  Future<String> get getImageDownloadLink async {
    String downloadLink;
    downloadLink =
        await FirebaseStorage.instance.ref().child(image).getDownloadURL();
    return downloadLink;
  }

  Future<String> get getPdfDownloadLink async {
    String downloadLink;
    downloadLink =
        await FirebaseStorage.instance.ref().child(pdfUrl).getDownloadURL();
    return downloadLink;
  }
}

// List<TeamMember> members = [
//   TeamMember(
//     uid: "e952b50e-7c95-5816-8ec6-c856b0c7a3f9",
//     name: "Clara Hicks",
//     role: "President",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://zirvu.co/fovbuhke",
//   ),
//   TeamMember(
//     uid: "04044afb-6654-5d4c-b684-0d7c84d78ace",
//     name: "Clarence Baldwin",
//     role: "Vice présidente coopération & relations internationales",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://muwtercol.net/davwavnum",
//   ),
//   TeamMember(
//     uid: "434fbcaa-8c86-566d-a6bb-b3c0fa3eefd3",
//     name: "Ian Pittman",
//     role: "Vice président recherche & développement",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://lehbus.ml/ic",
//   ),
//   TeamMember(
//     uid: "033bd05f-f03d-5c04-9abb-33ac0fd9f03c",
//     name: "Louise Crawford",
//     role: "Vice président business developement",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://vu.tf/sipjaj",
//   ),
//   TeamMember(
//     uid: "3658d04c-4aa5-5fb6-a796-97d8c1509ce9",
//     name: "Clyde Hoffman",
//     role: "Contrôle, Audit & Qualité",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://movbe.br/te",
//   ),
//   TeamMember(
//     uid: "ef21e077-7059-5b64-a6da-ab7be6c7d275",
//     name: "Daniel Luna",
//     role: "Innovation & Valorisation",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://asnog.be/gil",
//   ),
//   TeamMember(
//     uid: "2750f724-46de-528c-bcfc-b0a457e07b34",
//     name: "Virgie Holmes",
//     role: "Direction études et conseil",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://afces.nz/vop",
//   ),
//   TeamMember(
//     uid: "1c356039-dbed-505c-bc79-7309a778d491",
//     name: "Rose Burns",
//     role: "Direction études et conseil",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://hi.dm/jutu",
//   ),
//   TeamMember(
//     uid: "d54ece47-6c5e-5592-ba9f-b63db8bd7d5a",
//     name: "Olive Robinson",
//     role: "Cellule Experts R & D",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://bebguhpuw.cl/etcas",
//   ),
//   TeamMember(
//     uid: "762e7727-e7db-5ddd-a78e-40cdecc5c956",
//     name: "Lucille Walker",
//     role: "Cellule Experts R & D",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://kawgej.pg/milpoger",
//   ),
//   TeamMember(
//     uid: "f006d65e-261b-5645-965f-de4b04b9982c",
//     name: "Luke Shelton",
//     role: "Cellule Experts R & D",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://zatsoku.cz/cugi",
//   ),
//   TeamMember(
//     uid: "61ade172-137a-5b70-b41e-d371195c93c0",
//     name: "Olive Steele",
//     role: "Cellule Experts R & D",
//     image: "assets/images/ceo.png",
//     pdfUrl: "http://ah.sh/guk",
//   ),
//   TeamMember(
//       uid: "3f3e7ad4-10cb-5154-ae74-26c902436fea",
//       name: "Lina Roy",
//       role: "Cellule Experts R & D",
//       image: "assets/images/ceo.png",
//       pdfUrl: "http://lamto.pm/na"),
// ];
