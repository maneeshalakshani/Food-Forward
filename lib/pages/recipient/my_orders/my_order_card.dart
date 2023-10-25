import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/models/Order.dart';
import 'package:food_forward/services/recipient/recipientSerices.dart';

class MyOrdersCard extends HookWidget {
  const MyOrdersCard({
    Key? key, 
    required this.context,
    required this.data,
    required this.updateRoute,
  }) : super(key: key);
  
  final BuildContext context;
  final DocumentSnapshot data;
  final updateRoute;

  @override
  Widget build(BuildContext context) {
    final order = OrderClass.fromSnapshot(data);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        tileColor: const Color.fromARGB(255, 227, 227, 227),
        title: Text('ID: ${data.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              child: Expanded(
                child: ListView.builder(
                  itemCount: order.cartItems.length,
                  itemBuilder: (context, index) {
                    return Text("${order.cartItems[index].noOfItems} X ${order.cartItems[index].food.name}");
                  },
                ),
              ),
            ),
            Text(
              'Order Status: ${order.orderStatus}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: order.orderStatus.toLowerCase() == 'pending' 
                  ? const Color.fromARGB(255, 168, 153, 24) 
                  : order.orderStatus.toLowerCase() == 'reject' 
                    ? Colors.red 
                    : Colors.green,
              ),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   icon: const Icon(Icons.edit, color: Colors.green,),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red,),
              onPressed: () {
                RecipientFunction().deleteOrder(orderClass: order, context: context);
              },
            )
          ],
        ),
      ),
    );
  }
}
