import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/MyTask.dart';

class VolunteerFunctions {
  String fireStoreCollectionName = "MyTasks";

  getAllMyTasks() {
    return FirebaseFirestore.instance
        .collection(fireStoreCollectionName)
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