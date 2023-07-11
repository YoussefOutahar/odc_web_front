import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/events.dart';

class EventsController {
  //Create:
  static Future<Event?> addEvent(Event event) async {
    try {
      await FirebaseFirestore.instance
          .collection('Events')
          .doc()
          .set(event.toJson());

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection("Events")
              .where("name", isEqualTo: event.name)
              .where("description", isEqualTo: event.description)
              .where("date", isEqualTo: event.date)
              .where("city", isEqualTo: event.city)
              .get();

      final String uid = snapshot.docs.first.id;
      await FirebaseFirestore.instance
          .collection('Events')
          .doc(uid)
          .update({"uid": uid});

      event.uid = uid;
      return event;
    } catch (e) {
      return null;
    }
  }

  //Read:
  static Stream<List<Event>> getEvents() {
    try {
      return FirebaseFirestore.instance.collection('Events').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => Event.fromJson(document.data()))
              .toList());
    } catch (e) {
      debugPrint(e.toString());
      return const Stream.empty();
    }
  }

  static Future<Event?> getEvent(String uid) async {
    DocumentSnapshot? document;
    try {
      document =
          await FirebaseFirestore.instance.collection('Events').doc(uid).get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return Event.fromJson(document.data() as Map<String, dynamic>);
    }
    return null;
  }

  //Update:
  static Future<bool> updateEvent(Event event) async {
    try {
      await FirebaseFirestore.instance
          .collection('Events')
          .doc(event.uid)
          .update(event.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Delete:
  static Future<bool> deleteEvent(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Events').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
