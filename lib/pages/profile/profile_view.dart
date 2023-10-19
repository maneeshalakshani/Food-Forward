import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/authentication.dart';

class ProfileView extends HookWidget {
  const ProfileView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String name = 'loading';

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 5 * 1.5,
              width: width,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset("assets/home.jpg", height: height/5*1.3, width: width,)
                  ),
                  Positioned(
                    bottom: 30,
                    left: width/2.5,
                    child: const CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: AssetImage(
                        "assets/avatar.png",
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FutureBuilder<Map<String, dynamic>?>(
                      future: Authentications().getCurrentUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          // While the future is still running, you can show a loading indicator or placeholder.
                          return CircularProgressIndicator(); // Replace this with your loading widget.
                        } else if (snapshot.hasError) {
                          // If there was an error while fetching user data, handle it here.
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          // User data is available; you can access it from snapshot.data.
                          name = snapshot.data?['name'] ?? 'Name not found';

                          return Text(
                            name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                            ),
                          );
                        } else {
                          // No user data found, you can handle this case as well.
                          return Text("User data not found");
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  ClickableContainer(
                    route: MyProfileRoute(name: name, userId: Authentications().getCurrentUserId()), 
                    text: "View Profile",
                    width: width/10*9,
                    bgColor: LIGHT_PINK,
                    textColor: BLACK,
                    height: 50,
                  ),
                  ClickableContainer(
                    text: "Good Morning!",
                    width: width/10*9,
                    bgColor: DARK_PINK,
                    textColor: BLACK,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getUserData() async {
    var data = await Authentications().getCurrentUser();

    return data?['name'];
  }
}
