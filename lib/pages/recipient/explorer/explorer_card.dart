import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Cart.dart';
import 'package:food_forward/models/CartItem.dart';
import 'package:food_forward/models/Food.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';

class ExplorerCard extends HookWidget {
  const ExplorerCard({
    Key? key, 
    required this.context,
    required this.data,
    required this.cart,
    required this.authStore,
  }) : super(key: key);
  final BuildContext context;
  final DocumentSnapshot data;
  final Cart cart;
  final AuthStore authStore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final food = Food.fromSnapshot(data);

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width/5* 1.5,
                child: Image.network(
                  food.imageUrl,
                  height: 70,
                ),
              ),
              Container(
                width: width/5* 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "RS. ${food.price}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        CartItem item = CartItem(food: food, noOfItems: 1);
                        cart.addItem(item);
                        context.router.push(CartRoute(cart: cart,authStore: authStore));
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
