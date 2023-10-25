import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:food_forward/models/CartItem.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/Components/textField.dart';
import 'package:food_forward/pages/recipient/cart/payment_and_address/payment_drawer.dart';
import 'package:food_forward/pages/recipient/cart/payment_and_address/payment_state.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';

class PaymentAddressView extends HookWidget {
  PaymentAddressView({
    Key? key, 
    required this.authStore,
    required this.cartItems,
  }) : super(key: key);
  final AuthStore authStore;
  final List<CartItem> cartItems;

  final TextEditingController deliveryAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //function to handle payment
  void handlePayment(String cardNumber, String expiration, String cvv) {
    print("Payment details: Card Number: $cardNumber, Expiration: $expiration, CVV: $cvv");
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PaymentStore store = PaymentStore();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height/10*8.4,
          margin: const EdgeInsets.only(top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Title(
                    color: Colors.black, 
                    child: const Text(
                      "Payment and Address",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 110, 27, 21),
                      ),
                    ),
                  ),
                  CustomeTextField(
                    showTopLabel: true,
                    label: "Delivery Address",
                    prefixIcon: Icons.location_city,
                    marginTop: 20,
                    controller: deliveryAddressController,
                    errorText: "Delivery Address is required",
                  ),
                Container(
                  width: width/10 * 7.5,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                            "Select Payment Method",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                      ),
                      Observer(
                        builder: (context){
                          return RadioListTile(
                            title: const Text("Cash on Delivery"),
                            value: "Cash on Delivery",
                            groupValue: store.selectedPaymentMethod,
                            onChanged: (value) {
                              store.setPaymentMethod(selectedPaymentMethod: value!);
                            },
                          );
                        },
                      ),
                      Observer(
                        builder: (context){
                          return RadioListTile(
                            title: const Text("Pay from Card"),
                            value: "Pay from Card",
                            groupValue: store.selectedPaymentMethod,
                            onChanged: (value) {
                              store.setPaymentMethod(selectedPaymentMethod: value!);
                            },
                          );
                        },
                      ),
                      // Observer(
                      //   builder: (context){
                      //     return Text(store.selectedPaymentMethod);
                      //   },
                      // ),
                      SquareButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            store.selectedPaymentMethod == "Cash on Delivery"
                              ? RecipientFunction().createOrder(
                                  userId: Authentications().getCurrentUserId(), 
                                  cartItems: cartItems, 
                                  context: context, 
                                  route: OrderConfirmRoute(orderNo: "afc7687JJe3", authStore: authStore),
                                )
                              : showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext cnt) {
                                    return PaymentDrawerView(
                                      onPaymentComplete: handlePayment,
                                      context: context,
                                      cartItems: cartItems,
                                      authStore: authStore,
                                    );
                                  },
                                );
                          }    
                        }, 
                        text: "Checkout"
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }  
}
