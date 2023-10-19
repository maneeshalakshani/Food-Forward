import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Order.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';
import 'package:food_forward/services/volunteer/volunteer_services.dart';

class NotificationCard extends HookWidget {
  const NotificationCard({
    Key? key, 
    required this.context,
    required this.data,
  }) : super(key: key);
  final BuildContext context;
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final order = OrderClass.fromSnapshot(data);

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
                width: width/5* 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order No: ${data.id}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total Price: ${calculateTotalPrice(order: order)}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: const Text(
                        "See Location",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SquareButton(
                onPressed: (){
                  VolunteerFunctions().createMyTask(
                    userId: Authentications().getCurrentUserId(), 
                    orderId: data.id, 
                    context: context, 
                    route: const VolunteerProfileRoute(), 
                    taskStatus: "Pending",
                    latitude: order.latitude,
                    longitude: order.longitude,
                    orderClass: order,
                  );
                }, 
                text: "Accept",
                btnWidth: 100,
                btnColor: Colors.green,
                btnPadding: const EdgeInsets.symmetric(vertical: 0),
                btnMargin: const EdgeInsets.symmetric(vertical: 10),
              ),
              SquareButton(
                onPressed: (){
                  RecipientFunction().updateOrderPickedField(
                    orderClass: order, 
                    picked: "reject", 
                    context: context, 
                    route: null
                  );
                }, 
                text: "Decline",
                btnColor: Colors.red,
                btnWidth: 100,
                btnPadding: const EdgeInsets.symmetric(vertical: 0),
                btnMargin: const EdgeInsets.symmetric(vertical: 10),
              )
            ],
          )
        ],
      ),
    );
  }

  calculateTotalPrice({required OrderClass order}){
    double total = 0.0;
    for(int i=0; i<order.cartItems.length; i++){
      total = total + double.parse(order.cartItems[i].food.price) * double.parse(order.cartItems[i].noOfItems.toString());
    }
    return total;
  }
}
