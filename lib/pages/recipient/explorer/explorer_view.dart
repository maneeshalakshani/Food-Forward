import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Cart.dart';
import 'package:food_forward/models/CartItem.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/recipient/explorer/explorer_card.dart';
import 'package:food_forward/routes/routes.gr.dart';

class ExplorerView extends HookWidget {
  const ExplorerView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Cart cart = Cart();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
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
              Container(
                height: height,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ExplorerCard(
                      img: 'assets/logo.png', 
                      name: "Food Name abc1", 
                      price: 300, 
                      addToCart: (){
                        CartItem item = CartItem("Food Name abc1", 300, 1);
                        cart.addItem(item);
                        context.router.push(CartRoute(cart: cart));
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
