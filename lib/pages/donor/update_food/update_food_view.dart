import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Food.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/pages/donor/add_food/date_picker.dart';
import 'package:food_forward/pages/donor/add_food/food_preference_selection.dart';
import 'package:food_forward/pages/donor/add_food/food_state.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/donor/donor_services.dart';

class DonorUpdateFoodView extends StatefulWidget {
  const DonorUpdateFoodView({super.key, required this.food, required this.authStore});
  final Food food;
  final AuthStore authStore;


  @override
  State<DonorUpdateFoodView> createState() => _DonorUpdateFoodViewState();
}

class _DonorUpdateFoodViewState extends State<DonorUpdateFoodView> {
  final TextEditingController foodNameController = TextEditingController();
  // final TextEditingController expiryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController envImpactController = TextEditingController();
  var selectedPreference; 
  FoodStore store = FoodStore();
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    foodNameController.text = widget.food.name;
    // expiryController.text = widget.food.expiryDate;
    quantityController.text = widget.food.quantity;
    priceController.text = widget.food.price;
    selectedPreference = widget.food.foodPreference;
    envImpactController.text = widget.food.environmentalImpact.toString();
    store.setSelectedDate(selectedDate: widget.food.expiryDate);
  }

  @override
  Widget build(BuildContext context) {
    selectedPreference = widget.food.foodPreference;
    return DonorUpdateFood(
      food: widget.food, 
      // expiryController: expiryController, 
      foodNameController: foodNameController, 
      priceController: priceController, 
      quantityController: quantityController, 
      selectedPreference: selectedPreference,
      envImpactController: envImpactController,
      store: store,
      authStore: widget.authStore,
      selectedDate: selectedDate,
    );
  }
}

// ignore: must_be_immutable
class DonorUpdateFood extends HookWidget {
  DonorUpdateFood({
    Key? key,
    required this.food,
    // required this.expiry,
    required this.foodNameController, 
    required this.priceController,
    required this.quantityController,
    required this.selectedPreference,
    required this.envImpactController,
    required this.authStore,
    required this.store,
    required this.selectedDate,
  }) : super(key: key);
  final Food food;
  final TextEditingController foodNameController;
  // final TextEditingController expiryController;
  final TextEditingController quantityController;
  final TextEditingController priceController;
  final TextEditingController envImpactController;
  var selectedPreference; 
  FoodStore store;
  final AuthStore authStore;
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
                  "Update Food",
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
                controller: foodNameController,
                textColor: Colors.white,
              ),
              CustomeTextField(
                label: "Price",
                showTopLabel: true,
                controller: priceController,
                textColor: Colors.white,
              ),
              CustomeTextField(
                label: "Available Quantity",
                showTopLabel: true,
                controller: quantityController,
                textColor: Colors.white,
              ),
              // CustomeTextField(
              //   label: "Expiry Date",
              //   showTopLabel: true,
              //   controller: expiryController,
              // ),
              CustomeTextField(
                label: "Environmental Impact",
                showTopLabel: true,
                controller: envImpactController,
                textColor: Colors.white,
              ),
              FoodPreferenceSelection(
                onChanged: (value) {
                  selectedPreference = value;
                },
              ),
              DatePickerWidget(store: store, selectedDate: selectedDate,),
              SquareButton(
                onPressed: () {
                  print("Selected Food Preference: $selectedPreference");
                  DonorFunction().updateFoodItem(
                    food: food, 
                    name: foodNameController.text, 
                    price: priceController.text, 
                    quantity: quantityController.text, 
                    expiryDate: store.selectedDate, 
                    foodPreference: selectedPreference, 
                    imageUrl: food.imageUrl,
                    environmentalImpact: int.parse(envImpactController.text),
                    context: context,
                    userId: food.userId,
                    route: DonorFoodListRoute(authStore: authStore)
                  );
                    // context.router.push(const DonorFoodListRoute());
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
