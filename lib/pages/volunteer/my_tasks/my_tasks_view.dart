import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/volunteer/my_tasks/task_card.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerTaskView extends HookWidget {
  const VolunteerTaskView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Title(
                color: Colors.black, 
                child: const Text(
                  "My Tasks",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: height/10 * 6.5,
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i){
                    return TaskCard(
                      orderNo: "aUYUW874jHG", 
                      seeLocationOnTap: (){}, 
                      nextOnPress: () => context.router.push(const VolunteerCompleteTaskRoute()), 
                      status: "Ongoing", 
                      completeTask: (){}
                    );
                  },
                )
              ),
              SquareButton(
                onPressed: () => context.router.pop(), 
                text: "Back"
              )
            ],
          ),
        )
      ),
    );
  }
}
