import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/Discount.dart';
import 'package:food_forward/models/MyTask.dart';
import 'package:food_forward/models/Order.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';

class VolunteerFunctions {
  String fireStoreCollectionName = "MyTasks";
  String discountFireStoreCollectionName = "Discounts";

  getAllMyTasks() {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .where('taskStatus', isEqualTo: 'Pending')
        .snapshots();
  }

  getAllCompletedTasksWithUser({required String userId}) {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
        .where('userId', isEqualTo: userId)
        .where('taskStatus', isEqualTo: 'Completed')
        .get();
  }

  getAllDiscountsById({required String userId}) {
    return FirebaseFirestore.instance
        .collection(discountFireStoreCollectionName)
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  createMyTask(
      {required String userId,
      required String orderId,
      required BuildContext context,
      required route,
      required String taskStatus,
      required String latitude,
      required String longitude,
      required OrderClass orderClass,
  }) async {

    MyTask myTask = MyTask(
      userId: userId, 
      orderId: orderId, 
      taskStatus: "Pending", 
      latitude: latitude,
      longitude: longitude,
    );
    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(fireStoreCollectionName)
            .doc()
            .set(myTask.toJson())
            .then((value) {
              context.router.push(route);
            });
      })
      .then((value) {
        RecipientFunction().updateOrderPickedField(
          orderClass: orderClass, 
          picked: "Picked", 
          context: context, 
          route: null
        );
      });
    } catch (e) {
      print(e.toString());
    }
  }

  createDiscount(
      {required String code,
      required double value,
      required String foodId,
      required String foodName,
      required String price,
  }) async {

    Discount discount = Discount(
      code: code, 
      value: value, 
      foodId: foodId, 
      foodName: foodName,
      price: price,
    );
    try {
      FirebaseFirestore.instance
          .runTransaction((Transaction transaction) async {
        await FirebaseFirestore.instance
            .collection(discountFireStoreCollectionName)
            .doc()
            .set(discount.toJson());
      });
    } catch (e) {
      print(e.toString());
    }
  }

  updateTask({
    required MyTask myTask,
    required String taskStatus,
    required String orderId,
    required String userId,
    required BuildContext context,
    required String latitude,
    required String longitude,
    required route,
  }) {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.update(myTask.documentReference, {
          'userId': userId,
          'orderId': orderId,
          'taskStatus': taskStatus,
          'longitude': longitude,
          'latitude': latitude,
        });
      })
      .then((value) => context.router.push(route));
    } catch (e) {
      print(e.toString());
    }
  }

  deleteMyTask({required MyTask myTask, required BuildContext context}) {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(myTask.documentReference);
    });
  }
}
