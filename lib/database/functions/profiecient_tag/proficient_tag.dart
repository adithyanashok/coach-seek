// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/database/model/proficient_tag/proficient_tag.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProficientTag {
  static final Tag_Collection = "tags";
  BuildContext context;
  ProficientTag({
    required this.context,
  });
  static Future<void> addTag(values) async {
    if (values.text == "") return;
    final db = FirebaseFirestore.instance;
    final tags = values.toJson();
    final data = await db.collection(Tag_Collection).add(tags);
  }

  static Stream<List<TagModel>> getTag({String? userId}) {
    final db = FirebaseFirestore.instance;
    final data = db
        .collection(Tag_Collection)
        .where(
          "userId",
          isEqualTo: userId,
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            final id = doc.id; // Get the document id
            final experience = TagModel(
              userId: data['userId'],
              text: data['text'],
              id: id,
            );
            return experience;
          }).toList(),
        );

    return data;
  }

  static Future<void> deleteTags(id) {
    final db = FirebaseFirestore.instance;
    return db.collection(Tag_Collection).doc(id).delete().then(
          (doc) => log("Document deleted"),
          onError: (e) => log("Error updating document $e"),
        );
  }
}
