import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_forward/models/CartItem.dart';


class OrderClass {
  late String userId;
  late List<CartItem> cartItems;
  DateTime dateTime = DateTime.now();
  late String orderStatus;
  late String latitude;
  late String longitude;
  late String picked;

  late DocumentReference documentReference;

  OrderClass({ 
    required this.userId, 
    required this.cartItems, 
    required this.orderStatus, 
    required this.latitude,
    required this.longitude,
    required this.picked,
  });

  OrderClass.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    userId = map["userId"];
    orderStatus = map["orderStatus"];
    longitude = map["longitude"];
    latitude = map["latitude"];
    picked = map["picked"];
    if (map["cartItems"] != null) {
      // Convert the list of dynamic items to List<CartItem>
      cartItems = (map["cartItems"] as List<dynamic>)
          .map((item) => CartItem.fromMap(item, documentReference: documentReference))
          .toList();
    }
    dateTime = map["dateTime"] != null ? (map["dateTime"] as Timestamp).toDate() : DateTime.now();
  }

  OrderClass.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cartItems': cartItemsToJson(),
      'dateTime': dateTime,
      'orderStatus': orderStatus,
      'longitude': longitude,
      'latitude': latitude,
      'picked': picked,
    };
  }

  List<Map<String, dynamic>> cartItemsToJson() {
    return cartItems.map((item) => item.toJson()).toList();
  }
}
