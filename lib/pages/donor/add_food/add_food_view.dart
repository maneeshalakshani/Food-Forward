import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/pages/donor/add_food/date_picker.dart';
import 'package:food_forward/pages/donor/add_food/food_preference_selection.dart';
import 'package:food_forward/pages/donor/add_food/food_state.dart';
import 'package:food_forward/pages/donor/add_food/image_picker_button.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/donor/donor_services.dart';

// ignore: must_be_immutable
class DonorAddFoodView extends HookWidget {
  DonorAddFoodView({
    Key? key,
    required this.authStore,
  }) : super(key: key);
  final AuthStore authStore;

  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController envImpactController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String selectedPreference = 'veg'; 
    FoodStore store = FoodStore();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.black,
          ),
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
                    color: Colors.white,
                  ),
                ),
              ),
              CustomeTextField(
                label: "Food Name",
                showTopLabel: true,
                textColor: Colors.white,
                controller: foodNameController,
              ),
              CustomeTextField(
                label: "Price",
                showTopLabel: true,
                textColor: Colors.white,
                controller: priceController,
              ),
              CustomeTextField(
                label: "Available Quantity",
                showTopLabel: true,
                textColor: Colors.white,
                controller: quantityController,
              ),
              // CustomeTextField(
              //   label: "Expiry Date",
              //   showTopLabel: true,
              //   controller: expiryController,
              // ),
              CustomeTextField(
                label: "Environmental Impact",
                showTopLabel: true,
                textColor: Colors.white,
                controller: envImpactController,
              ),
              FoodPreferenceSelection(
                onChanged: (value) {
                  selectedPreference = value;
                },
              ),
              ImagePickerWidget(store: store,),
              DatePickerWidget(store: store, selectedDate: selectedDate,),
              SquareButton(
                onPressed: () async {
                  print("Selected Food Preference: $selectedPreference");

                  await DonorFunction().createFoodItem(
                    name: foodNameController.text, 
                    price: priceController.text, 
                    quantity: quantityController.text, 
                    expiryDate: store.selectedDate, 
                    foodPreference: selectedPreference,
                    imageUrl: store.uploadedImageLink ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBxJxenAHi3BQqhFEjjW4m5u07Wg0dNC4u3k6jX0263bEM1CAb-k4mM10mOFDVVHt2h2E&usqp=CAU",
                    context: context,
                    userId: Authentications().getCurrentUserId(),
                    environmentalImpact: int.parse(envImpactController.text),
                    route: DonorFoodListRoute(authStore: authStore)
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
