import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/donor/food_items/food_details_modal.dart';
import 'package:food_forward/pages/donor/food_items/food_item_card.dart';
import 'package:food_forward/routes/routes.gr.dart';

class DonorFoodListView extends HookWidget {
  const DonorFoodListView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(DonorAddFoodRoute()),
        backgroundColor: const Color.fromARGB(255, 70, 17, 14),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Title(
                  color: Colors.black, 
                  child: const Text(
                    "Food Items",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              Container(
                height: height,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return FoodItemCard(
                      img: 'assets/logo.png', 
                      name: "Burger", 
                      price: 300, 
                      date: '03/10/2023',
                      showFoodItem: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FoodItemDetailsDialog(
                              img: 'assets/logo.png', 
                              name: "Burger", 
                              price: 300, 
                              date: '03/10/2023',
                              preference: "Veg", 
                              availableQuantity: 10, 
                              deleteOnPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm Delete"),
                                      content: const Text("Are you sure you want to delete this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text("Cancel"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("Delete"),
                                          onPressed: () {
                                            Navigator.of(context).pop(); 
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              updateOnPressed: () => context.router.push(const DonorUpdateFoodRoute()),
                            );
                          },
                        );
                      }
                    );
                  },
                ),
              )  
            ],
          ),
        ),
      ),
    );
  }
}
