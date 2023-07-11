import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../Models/formations.dart';

class FormationController {
  //Create:
  static Future<Formation?> addFormation(Formation formation) async {
    try {
      await FirebaseFirestore.instance
          .collection('Formations')
          .doc()
          .set(formation.toJson());

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('Formations')
              .where('title', isEqualTo: formation.title)
              .where('category', isEqualTo: formation.category)
              .get();
      final String uid = snapshot.docs.first.id;
      await FirebaseFirestore.instance
          .collection('Formations')
          .doc(uid)
          .update({'uid': uid});

      formation.uid = uid;
      return formation;
    } catch (e) {
      return null;
    }
  }

  //Read:
  static Stream<List<Formation>> getFormations() {
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

  static Future<Formation?> getFormation(String uid) async {
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
  static Future<bool> updateFormation(Formation formation) async {
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
  static Future<bool> deleteFormation(String uid) async {
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
