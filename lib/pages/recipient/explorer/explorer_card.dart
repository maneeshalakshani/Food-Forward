import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExplorerCard extends HookWidget {
  const ExplorerCard({
    Key? key, 
    required this.img,
    required this.name,
    required this.price,
    required this.addToCart,
  }) : super(key: key);
  
  final String img;
  final String name;
  final double price;
  final void Function()? addToCart;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width/5* 1.5,
                child: Image.asset(
                  "assets/delivery.png",
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
                      name,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "RS. $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: addToCart,
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
