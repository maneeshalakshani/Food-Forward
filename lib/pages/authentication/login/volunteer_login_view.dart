import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/authenticateNavigator.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/authentication.dart';

class VolunteerLoginView extends HookWidget {
  VolunteerLoginView({
    Key? key, 
    required this.userType,
    this.showAnalytics = false,
    required this.labelUser,
  }) : super(key: key);
  final String userType;
  final bool? showAnalytics;
  final String labelUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AuthStore store = AuthStore();

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
                Text(
                  "$labelUser Login",
                  style: const TextStyle(
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
                  label: "Email",
                  prefixIcon: Icons.email,
                  marginTop: 30,
                  controller: emailController,
                ),
                CustomeTextField(
                  label: "Password",
                  prefixIcon: Icons.password,
                  controller: passwordController,
                  obscureText: true,
                ),
                SquareButton(
                  text: "login".toUpperCase(),
                  onPressed: () {
                    userType == 'volunteer'
                      ? Authentications().loginWithEmailAndPassword(
                          email: emailController.text, 
                          password: passwordController.text, 
                          userType: userType, 
                          store: store,
                          context: context, 
                          route: const VolunteerProfileRoute()
                        )
                      : userType == 'donor'
                        ? Authentications().loginWithEmailAndPassword(
                            email: emailController.text, 
                            password: passwordController.text, 
                            store: store,
                            userType: userType, 
                            context: context, 
                            route: showAnalytics == true ? const ProfileRoute() : DonorFoodListRoute(authStore: store)
                          )
                        : Authentications().loginWithEmailAndPassword(
                            email: emailController.text, 
                            password: passwordController.text, 
                            store: store,
                            userType: userType, 
                            context: context, 
                            route: ExplorerRoute(authStore: store)
                          );
                  },
                ),
                showAnalytics == false
                  ? AuthenticateNavigator(
                      text: "Don't have an account?", 
                      linkText: "Sign Up",
                      route: VolunteerSignUpRoute(userType: userType, labelUser: labelUser),
                    )
                  : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
