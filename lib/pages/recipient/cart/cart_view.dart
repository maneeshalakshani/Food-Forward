import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/Cart.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'CartCard.dart';

class CartView extends StatefulWidget {
  final Cart cart;

  CartView({required this.cart});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height/10*7,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: ListView.builder(
                itemCount: widget.cart.items.length,
                itemBuilder: (context, index) {
                  final item = widget.cart.items[index];
                  return CartCard(
                    item: item,
                    onIncrement: (int delta) {
                      setState(() {
                        item.noOfItems += delta;
                      });
                    },
                    onDelete: () {
                      setState(() {
                        widget.cart.items.remove(item);
                      });
                    },
                  );
                },
              ),
            ),
            SquareButton(
              onPressed: () => context.router.push(OrderConfirmRoute(orderNo: "afc7687JJe3")), 
              text: "Place Order"
            )
          ],
        ),
      ),
    );
  }
}
