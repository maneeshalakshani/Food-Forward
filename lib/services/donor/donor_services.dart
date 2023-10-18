import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/Food.dart';

class DonorFunction {
  String fireStoreCollectionName = "Foods";

  getAllFood() {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .snapshots();
  }

  createFoodItem(
      {required String name,
      required String price,
      required String quantity,
      required String expiryDate,
      required String foodPreference,
      required String imageUrl,
      required route,
      required BuildContext context}) async {
    Food food = Food(name: name, price: price, quantity: quantity, expiryDate: expiryDate, foodPreference: foodPreference, imageUrl: imageUrl);
    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(fireStoreCollectionName)
            .doc()
            .set(food.toJson())
            .then((value) {
              context.router.push(route);
            });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updateFoodItem({
    required Food food,
    required String name,
    required String price,
    required String quantity,
    required String expiryDate,
    required String foodPreference,
    required String imageUrl,
    required BuildContext context,
    required route,
  }) {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.update(food.documentReference, {
          'name': name,
          'price': price,
          'quantity': quantity,
          'expiryDate': expiryDate,
          'foodPreference': foodPreference,
          'imageUrl': imageUrl,
        });
      })
      .then((value) => context.router.push(route));
    } catch (e) {
      print(e.toString());
    }
  }

  deleteFoodItem({required Food food, required BuildContext context}) {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(food.documentReference);
    })
    .then((value) => Navigator.of(context).pop());
  }

  // static Future<void> lauchMap(
  //     {required String latitude, required String longitude}) async {
  //   String googleUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   await launch(googleUrl);
  // }
}
