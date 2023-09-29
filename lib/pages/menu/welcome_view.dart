import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            Row(
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
            ClickableContainer(
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