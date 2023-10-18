import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/MyTask.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/common_services.dart';
import 'package:food_forward/services/volunteer/volunteer_services.dart';

class TaskCard extends HookWidget {
  const TaskCard({
    Key? key, 
    required this.context,
    required this.data,
  }) : super(key: key);
  final BuildContext context;
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final myTask = MyTask.fromSnapshot(data);

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
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
                  width: width/5* 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order ID: ${data.id}",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Delivery Status: ${myTask.taskStatus}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: InkWell(
                          onTap: () {
                            MapUtilityClass.openMap(double.parse(myTask.latitude), double.parse(myTask.longitude));
                          },
                          child: const Text(
                            "See Location",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: (){},
                      //   child: Container(
                      //     color: Colors.yellow,
                      //     child: const Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text(
                      //         'Complete Task',
                      //         textAlign: TextAlign.center,
                      //       ),
                      //     ),
                      //   ),
                      // )
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
                    VolunteerFunctions().updateTask(
                      myTask: myTask, 
                      taskStatus: "Completed", 
                      orderId: myTask.orderId, 
                      userId: myTask.userId, 
                      context: context, 
                      latitude: myTask.latitude, 
                      longitude: myTask.longitude, 
                      route: const VolunteerCompleteTaskRoute(),
                    );
                  }, 
                  text: "Complete Task",
                  btnWidth: width/5 * 4,
                  btnColor: const Color.fromARGB(255, 81, 17, 12),
                  btnPadding: const EdgeInsets.symmetric(vertical: 0),
                  btnMargin: const EdgeInsets.only(top: 10),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
