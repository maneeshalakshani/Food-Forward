import 'package:flutter/material.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/routes/routes.gr.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Image.asset(
                LOGO_URL,
                height: 200.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  APP_NAME,
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClickableContainer(
                    text: "Donor Analytics", 
                    imgUrl: "assets/donor-menu.png",
                    width: 150,
                    // route: ProfileRoute(),
                    route: VolunteerLoginRoute(userType: 'donor', showAnalytics: true, labelUser: "Donor"),
                  ),
                  ClickableContainer(
                    text: "Recipient", 
                    imgUrl: "assets/recipient-menu.png",
                    width: 150,
                    route: VolunteerLoginRoute(userType: 'recipient', labelUser: "Recipient"),
                  ),
                ],
              ),
              ClickableContainer(
                text: "Volunteer Community", 
                imgUrl: "assets/avatar.png",
                width: 310,
                route: VolunteerLoginRoute(userType: 'volunteer', labelUser: "Volunteer"),
              ),
              ClickableContainer(
                text: "Donor Community", 
                imgUrl: "assets/donor-menu.png",
                width: 310,
                route: VolunteerLoginRoute(userType: 'donor', labelUser: "Donor"),
              ),
            ],
          ),
        )
      ),
    );
  }
}