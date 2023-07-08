import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/service.dart';

class ServiceController {
  //Create:
  static Future<bool> addService(Service service) async {
    try {
      await FirebaseFirestore.instance
          .collection('Services')
          .doc()
          .set(service.toJson());
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('Services')
              .where('title', isEqualTo: service.title)
              .where('image', isEqualTo: service.image)
              .get();
      final String uid = snapshot.docs.first.id;
      await FirebaseFirestore.instance
          .collection('Services')
          .doc(uid)
          .update({'uid': uid});
      return true;
    } catch (e) {
      return false;
    }
  }

  //Read:
  static Stream<List<Service>> getServices() {
    try {
      return FirebaseFirestore.instance.collection('Services').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => Service.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  static Future<Service?> getService(String uid) async {
    DocumentSnapshot? document;
    try {
      document = await FirebaseFirestore.instance
          .collection('Services')
          .doc(uid)
          .get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return Service.fromJson(document.data() as Map<String, dynamic>);
    }
    return null;
  }

  //Update:
  static Future<bool> updateService(Service service) async {
    try {
      await FirebaseFirestore.instance
          .collection('Services')
          .doc(service.uid)
          .update(service.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Delete:
  static Future<bool> deleteService(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Services').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
