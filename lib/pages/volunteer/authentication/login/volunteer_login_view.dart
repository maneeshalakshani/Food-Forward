import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/authenticateNavigator.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerLoginView extends HookWidget {
  const VolunteerLoginView({
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
          height: height-160,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(120, 0, 0, 0)),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Volunteer Login",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: AssetImage(
                      "assets/avatar.png",
                    ),
                  )
                ),
                const Text(
                  "Sign in to your account",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                const CustomeTextField(
                  label: "Username",
                  prefixIcon: Icons.email,
                  marginTop: 30,
                ),
                const CustomeTextField(
                  label: "Password",
                  prefixIcon: Icons.password,
                ),
                SquareButton(
                  text: "login".toUpperCase(),
                  onPressed: () => context.router.push(const VolunteerProfileRoute()),
                ),
                const AuthenticateNavigator(
                  text: "Don't have an account?", 
                  linkText: "Sign Up",
                  route: VolunteerSignUpRoute(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
