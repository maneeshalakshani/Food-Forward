import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/volunteer/my_profile/labe_data_viewer.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerProfileView extends HookWidget {
  const VolunteerProfileView({
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
          // height: height-height/10*1.29,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Title(
                color: Colors.black, 
                child: const Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: const Color.fromARGB(255, 207, 207, 207),
                height: height/10 * 5,
                width: width/5 * 4,
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CircleAvatar(
                        maxRadius: 70,
                        backgroundImage: AssetImage(
                          "assets/avatar.png",
                        ),
                      ),
                    ),
                    Text(
                      "Volunteer Distributor - Bronze User 1",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    LabelDataViewer(
                      label: "Name", 
                      text: "JYGJGWDW",
                    ),
                    LabelDataViewer(
                      label: "Email", 
                      text: "gkjhsrf@gmail.com",
                    ),
                    LabelDataViewer(
                      label: "Address", 
                      text: "No 10. ABC Street, Galle road, colombo",
                    ),
                    LabelDataViewer(
                      label: "Tel", 
                      text: "1231231234",
                    ),
                  ],
                ),
              ),
              SquareButton(
                onPressed: () => context.router.push(const VolunteerNotificationsRoute()), 
                text: "View Notifications"
              ),
              SquareButton(
                onPressed: () => context.router.push(const VolunteerTaskRoute()), 
                text: "View My Tasks",
                btnMargin: const EdgeInsets.symmetric(vertical: 0),
              ),
              SquareButton(
                onPressed: (){}, 
                text: "Logout"
              ),
            ],
          ),
        )
      ),
    );
  }
}
