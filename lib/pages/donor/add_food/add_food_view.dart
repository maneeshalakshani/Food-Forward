import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/pages/donor/add_food/food_preference_selection.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/donor/donor_services.dart';

class DonorAddFoodView extends HookWidget {
  DonorAddFoodView({
    Key? key,
  }) : super(key: key);

  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String selectedPreference = 'veg'; 

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
                  "Add Food",
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
                controller: foodNameController,
              ),
              CustomeTextField(
                label: "Price",
                showTopLabel: true,
                controller: priceController,
              ),
              CustomeTextField(
                label: "Available Quantity",
                showTopLabel: true,
                controller: quantityController,
              ),
              CustomeTextField(
                label: "Expiry Date",
                showTopLabel: true,
                controller: expiryController,
              ),
              FoodPreferenceSelection(
                onChanged: (value) {
                  selectedPreference = value;
                },
              ),
              SquareButton(
                onPressed: () async {
                  print("Selected Food Preference: $selectedPreference");

                  await DonorFunction().createFoodItem(
                    name: foodNameController.text, 
                    price: priceController.text, 
                    quantity: quantityController.text, 
                    expiryDate: expiryController.text, 
                    foodPreference: selectedPreference,
                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBxJxenAHi3BQqhFEjjW4m5u07Wg0dNC4u3k6jX0263bEM1CAb-k4mM10mOFDVVHt2h2E&usqp=CAU",
                    context: context,
                    route: const DonorFoodListRoute()
                  );
                },
                text: "Add Food",
              )
            ],
          ),
        ),
      ),
    );
  }
}
