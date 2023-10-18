import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/recipient/my_orders/my_order_card.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';

class MyOrdersView extends StatefulWidget {
  @override
  _MyOrdersViewState createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: height,
        width: width,
        child: Column(
          children: [
            Title(
              color: Colors.black, 
              child: const Text(
                "My Orders",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 110, 27, 21),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: RecipientFunction().getAllOrders(),
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
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {;
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        return MyOrdersCard(
          context: context, 
          data: snapshot[index], 
          updateRoute: MyOrdersRoute()
        );
      },
    );
  }
}
