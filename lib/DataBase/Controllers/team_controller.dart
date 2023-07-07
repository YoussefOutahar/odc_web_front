import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:odc/DataBase/Models/team.dart';

class TeamController {
  //Create:
  Future<bool> addTeam(TeamMember member) async {
    try {
      await FirebaseFirestore.instance.collection('Teams').add(member.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  //Read:
  Stream<List<TeamMember>> getTeams() {
    try {
      return FirebaseFirestore.instance.collection('Teams').snapshots().map(
          (snapshot) => snapshot.docs
              .map((document) => TeamMember.fromJson(document.data()))
              .toList());
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<TeamMember?> getTeam(String uid) async {
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
  Future<bool> updateTeam(TeamMember member) async {
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
  Future<bool> deleteTeam(String id) async {
    try {
      await FirebaseFirestore.instance.collection('Teams').doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}
