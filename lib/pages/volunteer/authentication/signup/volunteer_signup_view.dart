import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';

class VolunteerSignUpView extends HookWidget {
  const VolunteerSignUpView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
