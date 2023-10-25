import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/models/Cart.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'CartCard.dart';

class CartView extends StatefulWidget {
  final Cart cart;
  final AuthStore authStore;

  CartView({required this.cart, required this.authStore,});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double total = calculateTotal();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height/10*6,
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
            Text(
              "Total: Rs.${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SquareButton(
              onPressed: (){
                // RecipientFunction().createOrder(
                //   userId: Authentications().getCurrentUserId(), 
                //   cartItems: widget.cart.items, 
                //   context: context, 
                //   route: OrderConfirmRoute(orderNo: "afc7687JJe3", authStore: widget.authStore),
                // );

                context.router.push(PaymentAddressRoute(cartItems:  widget.cart.items, authStore: widget.authStore));
              }, 
              text: "Place Order"
            ),
            SquareButton(
              onPressed: (){
                context.router.pop();
              }, 
              text: "Go Back to Explorer",
              btnMargin: const EdgeInsets.only(top: 0),
            )
          ],
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0;
    for (var item in widget.cart.items) {
      total += double.parse(item.food.price) * item.noOfItems;
    }
    return total;
  }
}
