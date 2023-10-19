import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  late String name;
  late String price;
  late String quantity;
  late DateTime expiryDate;
  late String foodPreference;
  late String imageUrl;
  late int environmentalImpact;
  late String userId;

  late DocumentReference documentReference;

  Food(
    {required this.name,
    required this.price,
    required this.quantity,
    required this.expiryDate,
    required this.foodPreference,
    required this.imageUrl,
    required this.environmentalImpact,
    required this.userId,
  });

  Food.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    name = map["name"];
    price = map["price"];
    quantity = map["quantity"];
    expiryDate = (map["expiryDate"] as Timestamp).toDate();
    foodPreference = map["foodPreference"];
    imageUrl = map["imageUrl"];
    environmentalImpact = map["environmentalImpact"];
    userId = map["userId"];
  }

  Food.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);

  toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'expiryDate': expiryDate,
      'foodPreference': foodPreference,
      'imageUrl': imageUrl,
      'environmentalImpact': environmentalImpact,
      'userId': userId,
    };
  }
}
