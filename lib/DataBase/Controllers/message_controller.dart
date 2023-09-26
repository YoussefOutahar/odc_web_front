import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/message.dart';

class MessageController {
  static Future<Message?> addMessage(Message msg) async {
    try {
      await FirebaseFirestore.instance.collection('Messages').doc().set(msg.toJson());

      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("Messages").where("message", isEqualTo: msg.message).get();

      final String uid = snapshot.docs.first.id;
      await FirebaseFirestore.instance.collection('Messages').doc(uid).update({"uid": uid});

      msg.uid = uid;
      return msg;
    } catch (e) {
      return null;
    }
  }

  static Future<Message?> getMessage(String uid) async {
    DocumentSnapshot? document;
    try {
      document = await FirebaseFirestore.instance.collection('Messages').doc(uid).get();
    } catch (e) {
      debugPrint(e.toString());
    }

    if (document != null && document.exists) {
      return Message.fromJson(document.data() as Map<String, dynamic>);
    }

    return null;
  }

  static Stream<List<Message>> getMessages() {
    try {
      return FirebaseFirestore.instance
          .collection('Messages')
          .snapshots()
          .map((snapshot) => snapshot.docs.map((document) => Message.fromJson(document.data())).toList());
    } catch (e) {
      debugPrint(e.toString());
      return const Stream.empty();
    }
  }

  static Future<List<Message>> getMessagesFuture() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('Messages').get();
      return snapshot.docs.map((document) => Message.fromJson(document.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  static Future<bool> updateMessage(Message msg) async {
    try {
      await FirebaseFirestore.instance.collection('Messages').doc(msg.uid).update(msg.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> deleteMessage(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('Messages').doc(uid).delete();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
