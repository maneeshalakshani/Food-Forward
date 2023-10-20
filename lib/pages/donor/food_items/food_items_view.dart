import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Food.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/donor/food_items/food_item_card.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/donor/donor_services.dart';

class DonorFoodListView extends HookWidget {
  const DonorFoodListView({
    Key? key, 
    required this.authStore,
  }) : super(key: key);
  final AuthStore authStore;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(DonorAddFoodRoute(authStore: authStore)),
        backgroundColor: const Color.fromARGB(255, 70, 17, 14),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height/10*9,
          margin: const EdgeInsets.only(top: 30, right: 20, left: 20),
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: DonorFunction().getAllFoodByUserId(userId: authStore.userId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      return buildList(context, snapshot.data?.docs);
                    }
                    return const Text("Loading...");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return FoodItemCard(
          context: context,
          data: snapshot[index],
          updateRoute: DonorUpdateFoodRoute(food: Food.fromSnapshot(snapshot[index]), authStore: authStore),
        );
      },
    );
  }
}
