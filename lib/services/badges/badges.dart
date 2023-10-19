import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/Badge.dart';

class BadgesFunction {
  String fireStoreCollectionName = "Badges";

  getAllBadges({required String userId}) {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  getAllBadgesWithCategory({required String userId, required String category}) {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .where('userId', isEqualTo: userId)
        .where('category', isEqualTo: category)
        .get();
  }

  getAllBadgesWithName({required String userId, required String name}) {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .where('userId', isEqualTo: userId)
        .where('name', isEqualTo: name)
        .get();
  }

  createBadge(
      {required String name,
      required String category,
      required String description,
      required String userId,
      required String imageUrl,}) async {
    BadgeClass badge = BadgeClass(
      name: name, 
      category: category, 
      description: description, 
      userId: userId,
      imageUrl: imageUrl,
    );
    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(fireStoreCollectionName)
            .doc()
            .set(badge.toJson())
            .then((value) {
              print("Badge Created");
            });
      });
    } catch (e) {
      print(e.toString());
    }
  }



  deleteBadge({required BadgeClass badgeClass, required BuildContext context}) {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(badgeClass.documentReference);
    })
    .then((value) => Navigator.of(context).pop());
  }
}
