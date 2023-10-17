import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerCompleteTaskView extends HookWidget {
  const VolunteerCompleteTaskView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 219, 219, 219),
                width: width,
                margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: width/3*1.2,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Task Completed",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const Text(
                      "Good Job !",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 187, 172, 38),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage(
                            "assets/avatar.png",
                          ),
                        ),
                    ),
                    const Text(
                      "You received 10 points",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 187, 172, 38),
                      ),
                    ),
                  ],
                ),
              ),
              SquareButton(
                onPressed: () => context.router.push(const VolunteerNotificationsRoute()), 
                text: "View Notifications"
              )
            ],
          ),
        )
      ),
    );
  }
}
