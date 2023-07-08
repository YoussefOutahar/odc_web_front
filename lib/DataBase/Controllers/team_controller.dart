import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:odc/DataBase/Models/team.dart';

class TeamController {
  //Create:
  static Future<bool> addTeam(TeamMember member) async {
    try {
      await FirebaseFirestore.instance
          .collection('Teams')
          .doc()
          .set(member.toJson());

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance
              .collection('Teams')
              .where('name', isEqualTo: member.name)
              .where("role", isEqualTo: member.role)
              .where('image', isEqualTo: member.image)
              .get();

      final String uid = snapshot.docs.first.id;

      await FirebaseFirestore.instance
          .collection('Teams')
          .doc(uid)
          .update({'uid': uid});
      return true;
    } catch (e) {
      return false;
    }
  }

  //Read:
  static Stream<List<TeamMember>> getTeams() {
    try {
      return FirebaseFirestore.instance.collection('Teams').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => TeamMember.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  static Future<TeamMember?> getTeam(String uid) async {
    DocumentSnapshot? document;
    try {
      document =
          await FirebaseFirestore.instance.collection('Teams').doc(uid).get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return TeamMember.fromJson(document.data() as Map<String, dynamic>);
    }
    return null;
  }

  //Update:
  static Future<bool> updateTeam(TeamMember member) async {
    try {
      await FirebaseFirestore.instance
          .collection('Teams')
          .doc(member.uid)
          .update(member.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Delete:
  static Future<bool> deleteTeam(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Teams').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
