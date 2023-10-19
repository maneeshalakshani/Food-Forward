import 'package:cloud_firestore/cloud_firestore.dart';

class Discount {
  late String code;
  late double value;
  late String foodId;
  late String foodName;
  late String price;

  late DocumentReference documentReference;

  Discount(
    {required this.code,
    required this.value,
    required this.foodId,
    required this.foodName,
    required this.price,
  });

  Discount.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    code = map["code"];
    value = map["value"];
    foodId = map["foodId"];
    foodName = map["foodName"];
    price = map["price"];
  }

  Discount.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);

  toJson() {
    return {
      'code': code,
      'value': value,
      'foodId': foodId,
      'foodName': foodName,
      'price': price,
    };
  }
}
