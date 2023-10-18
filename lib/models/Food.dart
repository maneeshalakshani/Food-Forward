import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  late String name;
  late String price;
  late String quantity;
  late String expiryDate;
  late String foodPreference;
  late String imageUrl;

  late DocumentReference documentReference;

  Food(
    {required this.name,
    required this.price,
    required this.quantity,
    required this.expiryDate,
    required this.foodPreference,
    required this.imageUrl,
  });

  Food.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    name = map["name"];
    price = map["price"];
    quantity = map["quantity"];
    expiryDate = map["expiryDate"];
    foodPreference = map["foodPreference"];
    imageUrl = map["imageUrl"];
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
    };
  }
}
