import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/events.dart';

class EventsController {
  //Create:
  Future<bool> addEvent(Event event) async {
    try {
      await FirebaseFirestore.instance.collection('Events').add(event.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  // //Read:
  // Future<List<Event>> getEvents() async {
  //   List<Event> events = [];
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Events')
  //         .get()
  //         .then((QuerySnapshot querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //         events.add(Event.fromJson(doc.data()));
  //       });
  //     });
  //     return events;
  //   } catch (e) {
  //     return events;
  //   }
  // }

  // //Update:
  // Future<bool> updateEvent(Event event) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('Events')
  //         .doc(event.id)
  //         .update(event.toJson());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  //Delete:
  Future<bool> deleteEvent(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Events').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
