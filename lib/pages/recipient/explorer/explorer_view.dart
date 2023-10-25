import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Cart.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/recipient/explorer/explorer_card.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/donor/donor_services.dart';

class ExplorerView extends HookWidget {
  const ExplorerView({
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
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height/10*8.4,
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Title(
                  color: Colors.black, 
                  child: const Text(
                    "Have a meal today!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 110, 27, 21),
                    ),
                  ),
                ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: authStore.foodPreference != 'all'
                    ? DonorFunction().getAllFoodByFoodPreference(userId: authStore.userId!, preference: authStore.foodPreference!)
                    : DonorFunction().getAllFood(),
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
              )  
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    Cart cart = Cart();
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return ExplorerCard(
          context: context,
          data: snapshot[index],
          cart: cart,
          authStore: authStore,
        );
      },
    );
  }
  
}
