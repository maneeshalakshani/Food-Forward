import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/authenticateNavigator.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/routes/routes.gr.dart';

class VolunteerSignUpView extends HookWidget {
  VolunteerSignUpView({
    Key? key,
    required this.userType,
  }) : super(key: key);
  final String userType;

  // Create a state variable for delivery preference
  final ValueNotifier<String> deliveryPreference = ValueNotifier<String>('veg');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Create a function to handle the sign-up button click
    void handleSignUpClick() {
      // Get the selected delivery preference
      String selectedPreference = deliveryPreference.value;

      // You can use 'selectedPreference' in your sign-up process
      print('Selected Delivery Preference: $selectedPreference');
      // Add your sign-up logic here
    }

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(120, 0, 0, 0)),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                userType == 'recipient'
                  ? StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Delivery Preference",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 'veg',
                                  groupValue: deliveryPreference.value,
                                  onChanged: (value) {
                                    setState(() {
                                      deliveryPreference.value = value!;
                                    });
                                  },
                                ),
                                Text('Veg'),
                                Radio(
                                  value: 'nonveg',
                                  groupValue: deliveryPreference.value,
                                  onChanged: (value) {
                                    setState(() {
                                      deliveryPreference.value = value!;
                                    });
                                  },
                                ),
                                Text('Non-Veg'),
                                Radio(
                                  value: 'all',
                                  groupValue: deliveryPreference.value,
                                  onChanged: (value) {
                                    setState(() {
                                      deliveryPreference.value = value!;
                                    });
                                  },
                                ),
                                Text('All'),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                  : const SizedBox(),
                SquareButton(
                  text: "Sign Up".toUpperCase(),
                  onPressed: handleSignUpClick, // Call the function on button click
                ),
                AuthenticateNavigator(
                  text: "Already have an account?",
                  linkText: "Login",
                  route: VolunteerLoginRoute(userType: userType),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
