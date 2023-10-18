import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/CartItem.dart';
import 'package:food_forward/models/Order.dart';

class RecipientFunction {
  String fireStoreCollectionName = "Orders";

  getAllOrders() {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .orderBy('dateTime')
        .snapshots();
  }

  getAllOrdersForNotification() {
    return FirebaseFirestore.instance
      .collection(fireStoreCollectionName)
      .where('picked', isEqualTo: 'Pending')
      .snapshots();
  }

  createOrder(
      {required String userId,
      required List<CartItem> cartItems,
      required BuildContext context,
      required route,
  }) async {

    OrderClass orderClass = OrderClass(userId: userId, cartItems: cartItems, orderStatus: "Pending", latitude: "70.4522", longitude: "80.3452", picked: "Pending");
    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(fireStoreCollectionName)
            .doc()
            .set(orderClass.toJson())
            .then((value) {
              context.router.push(route);
            });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updateOrder({
    required OrderClass orderClass,
    required String userId,
    required List<CartItem> cartItems,
    required BuildContext context,
    required String picked,
    required route,
  }) {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.update(orderClass.documentReference, {
          'userId': userId,
          'cartItems': cartItems,
          'picked': picked,
        });
      })
      .then((value) => route == null ? null : context.router.push(route));
    } catch (e) {
      print(e.toString());
    }
  }

  updateOrderPickedField({
    required OrderClass orderClass,
    required String picked,
    required BuildContext context,
    required route,
  }) {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.update(orderClass.documentReference, {
          'picked': picked,
        });
      }).then((value) => route == null ? null : context.router.push(route));
    } catch (e) {
      print(e.toString());
    }
  }


  deleteOrder({required OrderClass orderClass, required BuildContext context}) {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(orderClass.documentReference);
    });
  }
}
