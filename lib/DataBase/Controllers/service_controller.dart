import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/service.dart';

class ServiceController {
  //Create:
  Future<bool> addService(Service service) async {
    try {
      await FirebaseFirestore.instance
          .collection('Services')
          .add(service.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Read:
  Stream<List<Service>> getServices() {
    try {
      return FirebaseFirestore.instance.collection('Services').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => Service.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<Service?> getService(String uid) async {
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
  Future<bool> updateService(Service service) async {
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
  Future<bool> deleteService(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Services').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
