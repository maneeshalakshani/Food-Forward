import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Food.dart';
import 'package:food_forward/pages/donor/food_items/food_details_modal.dart';
import 'package:food_forward/services/donor/donor_services.dart';

class FoodItemCard extends HookWidget {
  const FoodItemCard({
    Key? key, 
    required this.context,
    required this.data,
    required this.updateRoute,
  }) : super(key: key);
  
  final BuildContext context;
  final DocumentSnapshot data;
  final updateRoute;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final food = Food.fromSnapshot(data);

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width/5* 1.5,
                child: Image.network(
                  food.imageUrl,
                  height: 100,
                ),
              ),
              Container(
                width: width/5* 2.1,
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Price: RS. ${food.price}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Expiry Date: ${food.expiryDate.toString().split(" ")[0]}",
                      style: const TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () => showFoodItem(
                    date: food.expiryDate.toString().split(' ')[0],
                    name: food.name,
                    imageUrl: food.imageUrl,
                    preference: food.foodPreference,
                    price: food.price,
                    quantity: food.quantity,
                    food: food,
                  ),
                  child: const Icon(
                    Icons.forward,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  showFoodItem({
    required String imageUrl, 
    required String name, 
    required String price, 
    required String date, 
    required String preference,
    required String quantity,
    required Food food,
  }){
    showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FoodItemDetailsDialog(
                              img: imageUrl, 
                              name: name, 
                              price: double.parse(price), 
                              date: date,
                              preference: preference, 
                              availableQuantity: int.parse(quantity), 
                              deleteOnPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm Delete"),
                                      content: const Text("Are you sure you want to delete this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("Delete"),
                                          onPressed: () {
                                            DonorFunction().deleteFoodItem(food: food, context: context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              updateOnPressed: () => context.router.push(updateRoute),
                            );
                          },
                        );
  }
}
