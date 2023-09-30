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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Image.asset(
              LOGO_URL,
              height: 100.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                APP_NAME,
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClickableContainer(
                  text: "Donor", 
                  width: 150,
                  route: ProfileRoute(),
                ),
                ClickableContainer(
                  text: "Donor", 
                  width: 150,
                  route: ProfileRoute(),
                ),
              ],
            ),
            const ClickableContainer(
              text: "Donor", 
              width: 310,
              route: ProfileRoute(),
            ),
          ],
        )
      ),
    );
  }
}