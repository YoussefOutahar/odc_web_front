import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/formations.dart';

class FormationController {
  //Create:
  Future<bool> addFormation(Formation formation) async {
    try {
      await FirebaseFirestore.instance
          .collection('Formations')
          .add(formation.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Read:
  Stream<List<Formation>> getFormations() {
    try {
      return FirebaseFirestore.instance
          .collection('Formations')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((document) => Formation.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<Formation?> getFormation(String uid) async {
    DocumentSnapshot? document;
    try {
      document = await FirebaseFirestore.instance
          .collection('Formations')
          .doc(uid)
          .get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return Formation.fromJson(document.data() as Map<String, dynamic>);
    }
    return null;
  }

  //Update:
  Future<bool> updateFormation(Formation formation) async {
    try {
      await FirebaseFirestore.instance
          .collection('Formations')
          .doc(formation.uid)
          .update(formation.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Delete:
  Future<bool> deleteFormation(String uid) async {
    try {
      await FirebaseFirestore.instance
          .collection('Formations')
          .doc(uid)
          .delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
