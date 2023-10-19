import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Food.dart';

class RewardCard extends HookWidget {
  const RewardCard({
    Key? key, 
    required this.discountCode,
    required this.context,
    required this.data,
  }) : super(key: key);
  final String discountCode;
  final BuildContext context;
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final food = Food.fromSnapshot(data);

    return Container(
      width: width,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black, 
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Food ID: ${data.id}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Food Name: ${food.name}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            "Price: LKR ${food.price}.00",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 249, 194),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 80, 76, 6), 
                    width: 1.0,
                  ),
                ),
                child: Text(
                  'Code: UYukj23kj',
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 43, 2),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }  
}
