import 'package:cloud_firestore/cloud_firestore.dart';

class MyTask {
  late String userId;
  late String orderId;
  late String taskStatus;
  late String latitude;
  late String longitude;

  late DocumentReference documentReference;

  MyTask({ required this.userId, required this.orderId, required this.taskStatus, required this.latitude, required this.longitude });

  MyTask.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    userId = map["userId"];
    orderId = map["orderId"];
    taskStatus = map["taskStatus"];
    latitude = map["latitude"];
    longitude = map["longitude"];
  }

  MyTask.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'orderId': orderId,
      'taskStatus': taskStatus,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
