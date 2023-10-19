import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/routes/routes.gr.dart';

class ProfileView extends HookWidget {
  const ProfileView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    left: width/4,
                    child: const Text(
                      "MANEESHA LAKSHANI",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  ClickableContainer(
                    route: const MyProfileRoute(), 
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
}
