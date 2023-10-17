import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FoodItemCard extends HookWidget {
  const FoodItemCard({
    Key? key, 
    required this.img,
    required this.name,
    required this.price,
    required this.showFoodItem,
    required this.date,
  }) : super(key: key);
  
  final String img;
  final String name;
  final double price;
  final String date;
  final void Function()? showFoodItem;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width/5* 1.5,
                child: Image.asset(
                  "assets/delivery.png",
                  height: 70,
                ),
              ),
              Container(
                width: width/5* 2.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Price: RS. $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Expiry Date: $date",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: showFoodItem,
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
}
