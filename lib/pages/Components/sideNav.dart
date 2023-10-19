import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/services/authentication.dart';

class SideNav extends HookWidget {
  SideNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          ListTile(
            title: const Text("Home", style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              context.router.push(MenuRoute());
            },
          ),
          ListTile(
            title: const Text("Logout",style: TextStyle(color: Colors.white)),
            onTap: () {
              Authentications().logout().then((value) => context.router.push(const MenuRoute()));
            },
          ),
        ],
      ),
    );  
  }
}
