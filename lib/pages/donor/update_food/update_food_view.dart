import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/pages/donor/add_food/food_preference_selection.dart';
import 'package:food_forward/routes/routes.gr.dart';

class DonorUpdateFoodView extends HookWidget {
  const DonorUpdateFoodView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String selectedPreference = 'Veg'; 

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          width: width,
          child: Column(
            children: [
              Title(
                color: Colors.black,
                child: const Text(
                  "Update Food",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              CustomeTextField(
                label: "Food Name",
                showTopLabel: true,
              ),
              CustomeTextField(
                label: "Price",
                showTopLabel: true,
              ),
              CustomeTextField(
                label: "Available Quantity",
                showTopLabel: true,
              ),
              CustomeTextField(
                label: "Expiry Date",
                showTopLabel: true,
              ),
              FoodPreferenceSelection(
                onChanged: (value) {
                  selectedPreference = value;
                },
              ),
              SquareButton(
                onPressed: () {
                  print("Selected Food Preference: $selectedPreference");
                  context.router.push(const DonorFoodListRoute());
                },
                text: "Update Food",
                btnColor: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
