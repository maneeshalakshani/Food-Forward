import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/auth_state.dart';

class OrderConfirmView extends HookWidget {
  const OrderConfirmView({
    Key? key,
    required this.orderNo,
    required this.authStore,
  }) : super(key: key);
  final String orderNo;
  final AuthStore authStore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          margin: const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Your Order is placed !",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              // Text(
              //   "Order No: $orderNo",
              //   style: TextStyle(
              //     fontSize: 25,
              //     color: Colors.black,
              //   ),
              // ),
              SizedBox(height: 30),
              Text(
                "One of our volunteers will Contact you Soon".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "A small donation for the volunteer will make them motivated in their good deeds.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              SquareButton(
                onPressed: () => context.router.push(ExplorerRoute(authStore: authStore)),
                text: "OK",
              ),
              SquareButton(
                onPressed: () => context.router.push(const MyOrdersRoute()),
                text: "View My Orders",
                btnColor: const Color.fromARGB(255, 60, 17, 14),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
