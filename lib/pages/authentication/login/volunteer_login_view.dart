import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/authenticateNavigator.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerLoginView extends HookWidget {
  VolunteerLoginView({
    Key? key, 
    required this.userType,
  }) : super(key: key);
  final String userType;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  "Login",
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
                CustomeTextField(
                  label: "Username",
                  prefixIcon: Icons.email,
                  marginTop: 30,
                  controller: userNameController,
                ),
                CustomeTextField(
                  label: "Password",
                  prefixIcon: Icons.password,
                  controller: passwordController,
                ),
                SquareButton(
                  text: "login".toUpperCase(),
                  onPressed: () {
                    userType == 'volunteer'
                      ? context.router.push(const VolunteerProfileRoute())
                      : userType == 'donor'
                        ? context.router.push(const DonorFoodListRoute())
                        : context.router.push(const ExplorerRoute());
                  },
                ),
                AuthenticateNavigator(
                  text: "Don't have an account?", 
                  linkText: "Sign Up",
                  route: VolunteerSignUpRoute(userType: userType),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
