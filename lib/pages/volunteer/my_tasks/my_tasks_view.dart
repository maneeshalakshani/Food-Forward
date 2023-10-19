import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/volunteer/my_tasks/task_card.dart';
import 'package:food_forward/services/volunteer/volunteer_services.dart';

class VolunteerTaskView extends HookWidget {
  const VolunteerTaskView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: Container(
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
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: VolunteerFunctions().getAllMyTasks(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  }
                  if (snapshot.hasData) {
                    return buildList(context, snapshot.data?.docs);
                  }
                  return const Text("Loading...");
                },
              ),
            ),
            SquareButton(
              onPressed: () => context.router.pop(), 
              text: "Back"
            )
          ],
        ),
      ),
    );
  }

   Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return TaskCard(
          context: context, 
          data: snapshot[index],
        );
      },
    );
  }
}
