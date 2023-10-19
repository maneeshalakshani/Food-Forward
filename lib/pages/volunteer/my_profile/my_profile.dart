import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/volunteer/my_profile/labe_data_viewer.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/authentication.dart';

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
      drawer: SideNav(),
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
                child: FutureBuilder<Map<String, dynamic>?>(
                  future: getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // While the future is still running.
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.hasData) {
                      // User data is available; you can access it from snapshot.data.
                      final userData = snapshot.data;
                      final name = userData?['name'] ?? 'Name not found';
                      final email = userData?['email'] ?? 'Email not found';
                      final phone = userData?['phone'] ?? 'Phone not found';
                      final address = userData?['address'] ?? 'Address not found';
              
                      return Column(
                        children: [
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
                            "Volunteer Distributor",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          LabelDataViewer(
                            label: "Name", 
                            text: name,
                          ),
                          LabelDataViewer(
                            label: "Email", 
                            text: email,
                          ),
                          LabelDataViewer(
                            label: "Address", 
                            text: address,
                          ),
                          LabelDataViewer(
                            label: "Tel", 
                            text: phone,
                          ),
                        ],
                      );
                    } else {
                      // No user data found, you can handle this case as well.
                      return Text("User data not found");
                    }
                  },
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
                onPressed: () => context.router.push(const VolunteerRewardRoute()), 
                text: "Rewards"
              ),
            ],
          ),
        )
      ),
    );
  }

  Future<Map<String, dynamic>?> getUserData() async {
    return await Authentications().getCurrentUser();
  }
}
