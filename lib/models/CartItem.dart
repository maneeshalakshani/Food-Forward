import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_forward/models/Food.dart';

class CartItem {
  late Food food;
  late int noOfItems;

  late DocumentReference documentReference;

  CartItem({required this.food, required this.noOfItems});

  Map<String, dynamic> toJson() {
    return {
      'food': food.toJson(), 
      'noOfItems': noOfItems,
    };
  }

  CartItem.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    food = Food.fromMap(map["food"] as Map<String, dynamic>, documentReference: documentReference);
    noOfItems = map["noOfItems"];
  }

  CartItem.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);
}
