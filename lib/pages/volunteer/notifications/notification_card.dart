import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/squareButton.dart';

class NotificationCard extends HookWidget {
  const NotificationCard({
    Key? key, 
    required this.orderNo,
    required this.totalPrice,
    required this.seeLocationOnTap,
    required this.acceptOnPress,
    required this.rejectOnPress,
  }) : super(key: key);
  final String orderNo;
  final double totalPrice;
  final void Function()? seeLocationOnTap;
  final void Function()? acceptOnPress;
  final void Function()? rejectOnPress;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: Color.fromARGB(255, 236, 236, 236),
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
                      "Order No: $orderNo",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Total Price: $totalPrice",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: seeLocationOnTap,
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
                onPressed: acceptOnPress, 
                text: "Accept",
                btnWidth: 100,
                btnColor: Colors.green,
                btnPadding: const EdgeInsets.symmetric(vertical: 0),
                btnMargin: const EdgeInsets.symmetric(vertical: 10),
              ),
              SquareButton(
                onPressed: rejectOnPress, 
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
}
