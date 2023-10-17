import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/squareButton.dart';

class TaskCard extends HookWidget {
  const TaskCard({
    Key? key, 
    required this.orderNo,
    required this.seeLocationOnTap,
    required this.nextOnPress,
    required this.status,
    required this.completeTask,
  }) : super(key: key);
  final String orderNo;
  final void Function()? seeLocationOnTap;
  final void Function()? nextOnPress;
  final void Function()? completeTask;
  final String status;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: width/5* 1.5,
                child: Image.asset(
                  "assets/delivery.png",
                  height: 70,
                ),
              ),
              SizedBox(
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
                      "Delivery Status: $status",
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
                    InkWell(
                      onTap: completeTask,
                      child: Container(
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Complete Task',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SquareButton(
                onPressed: nextOnPress, 
                text: "Next",
                btnWidth: width/5 * 4,
                btnColor: const Color.fromARGB(255, 81, 17, 12),
                btnPadding: const EdgeInsets.symmetric(vertical: 0),
                btnMargin: const EdgeInsets.symmetric(vertical: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
