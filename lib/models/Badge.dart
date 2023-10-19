import 'package:cloud_firestore/cloud_firestore.dart';

class BadgeClass {
  late String userId;
  late String name;
  late String description;
  late String category;
  late String imageUrl;

  late DocumentReference documentReference;

  BadgeClass({ 
    required this.userId, 
    required this.name, 
    required this.description, 
    required this.category,
    required this.imageUrl,
  });

  BadgeClass.fromMap(Map<String, dynamic> map, {required this.documentReference}) {
    userId = map["userId"];
    name = map["name"];
    description = map["description"];
    category = map["category"];
    imageUrl = map["imageUrl"];
  }

  BadgeClass.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            documentReference: snapshot.reference);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
    };
  }
}
