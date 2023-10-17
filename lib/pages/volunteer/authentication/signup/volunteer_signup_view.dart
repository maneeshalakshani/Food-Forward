import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/authenticateNavigator.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerSignUpView extends HookWidget {
  const VolunteerSignUpView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(

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
                  "Volunteer Registration",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Enter your details",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
                const CustomeTextField(
                  label: "Email",
                  prefixIcon: Icons.email,
                  marginTop: 30,
                ),
                const CustomeTextField(
                  label: "Name",
                  prefixIcon: Icons.person,
                ),
                const CustomeTextField(
                  label: "Address",
                  prefixIcon: Icons.home,
                  marginTop: 30,
                ),
                const CustomeTextField(
                  label: "Contact Number",
                  prefixIcon: Icons.contact_phone,
                ),
                const CustomeTextField(
                  label: "Password",
                  prefixIcon: Icons.password,
                ),
                const CustomeTextField(
                  label: "Confirm Password",
                  prefixIcon: Icons.verified,
                ),
                SquareButton(
                  text: "Sign Up".toUpperCase(),
                  onPressed: (){},
                ),
                const AuthenticateNavigator(
                  text: "Already have an account?", 
                  linkText: "Sign Up",
                  route: VolunteerLoginRoute(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
