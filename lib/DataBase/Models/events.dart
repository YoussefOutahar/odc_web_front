import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Event {
  String? uid;
  String name;
  String organisation;
  Timestamp date;
  String description;
  String city;
  String theme;
  String image;

  Event({
    this.uid,
    required this.date,
    required this.organisation,
    required this.city,
    required this.theme,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      uid: json['uid'],
      name: json['name'],
      organisation: json['organisation'],
      date: json['date'],
      description: json['description'],
      city: json['city'],
      theme: json['theme'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'organisation': organisation,
        'date': date,
        'description': description,
        'city': city,
        'theme': theme,
        'image': image,
      };

  Future<String> get getImageDownloadLink async {
    String downloadLink;
    downloadLink =
        await FirebaseStorage.instance.ref().child(image).getDownloadURL();
    return downloadLink;
  }
}

// final events = [
//   Event(
//     uid: "9126d4f1-43c0-5996-8440-a67787e76338",
//     name: 'Event 1',
//     organisation: 'Organisation 1',
//     date: Timestamp.now(),
//     description: 'Description 1',
//     city: 'City 1',
//     theme: 'Theme 1',
//     image: 'assets/images/event1.jpg',
//   ),
//   Event(
//     uid: "1744c3d0-92e6-58f6-8037-41532686b5e9",
//     name: 'Event 2',
//     organisation: 'Organisation 2',
//     date: Timestamp.now(),
//     description: 'Description 2',
//     city: 'City 2',
//     theme: 'Theme 2',
//     image: 'assets/images/event2.jpg',
//   ),
//   Event(
//     uid: "991d6708-9340-58eb-9c74-4cc8fc22f8e9",
//     name: 'Event 3',
//     organisation: 'Organisation 3',
//     date: Timestamp.now(),
//     description: 'Description 3',
//     city: 'City 3',
//     theme: 'Theme 3',
//     image: 'assets/images/event3.jpg',
//   ),
//   Event(
//     uid: "567ab52d-161e-5a16-9643-dc6e24b78b55",
//     name: 'Event 4',
//     organisation: 'Organisation 4',
//     date: Timestamp.now(),
//     description: 'Description 4',
//     city: 'City 4',
//     theme: 'Theme 4',
//     image: 'assets/images/event4.jpg',
//   ),
//   Event(
//     uid: "91a1f00e-15ea-5afd-8f26-a214a6cecc3f",
//     name: 'Event 5',
//     organisation: 'Organisation 5',
//     date: Timestamp.now(),
//     description: 'Description 5',
//     city: 'City 5',
//     theme: 'Theme 5',
//     image: 'assets/images/event5.jpg',
//   ),
//   Event(
//     uid: "e14f9974-30e6-556a-8907-5fd092dd4b62",
//     name: 'Event 6',
//     organisation: 'Organisation 6',
//     date: Timestamp.now(),
//     description: 'Description 6',
//     city: 'City 6',
//     theme: 'Theme 6',
//     image: 'assets/images/event6.jpg',
//   ),
//   Event(
//     uid: "d901b749-c979-53cc-9eb6-8fd7e20f5753",
//     name: 'Event 7',
//     organisation: 'Organisation 7',
//     date: Timestamp.now(),
//     description: 'Description 7',
//     city: 'City 7',
//     theme: 'Theme 7',
//     image: 'assets/images/event7.jpg',
//   ),
// ];
