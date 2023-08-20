// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coach_seek/model/proficient_tag/proficient_tag.dart';
import 'package:flutter/material.dart';

class ProficientTag {
  static const tagCollection = "tags";
  BuildContext context;

  ProficientTag({
    required this.context,
  });

  // Add a tag to the Firestore collection
  static Future<void> addTag(values) async {
    if (values.text == "") return;
    final db = FirebaseFirestore.instance;
    final tags = values.toJson();
    await db.collection(tagCollection).add(tags);
  }

  // Get a stream of tags based on userId
  static Stream<List<TagModel>> getTag({String? userId}) {
    final db = FirebaseFirestore.instance;
    final data = db
        .collection(tagCollection)
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

  // Delete a tag from the Firestore collection using its id
  static Future<void> deleteTags(id) {
    final db = FirebaseFirestore.instance;
    return db.collection(tagCollection).doc(id).delete().then(
          (doc) => log("Document deleted"),
          onError: (e) => log("Error deleting document $e"),
        );
  }
}
