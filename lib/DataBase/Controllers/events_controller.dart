import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

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

  //Read:
  Stream<List<Event>> getEvents() {
    try {
      return FirebaseFirestore.instance.collection('Events').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => Event.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<Event?> getEvent(String uid) async {
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
  Future<bool> updateEvent(Event event) async {
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
  Future<bool> deleteEvent(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Events').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
