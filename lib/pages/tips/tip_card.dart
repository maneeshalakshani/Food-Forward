import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/routes/routes.gr.dart';

class TipCard extends HookWidget {
  const TipCard({
    Key? key, 
    required this.imageURL,
    required this.tipLabel,
    required this.tipID,
  }) : super(key: key);
  final String imageURL;
  final String tipLabel;
  final int tipID;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

   return Card(
    color: LIGHT_PINK,
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  imageURL,
                  height: 60,
                ),
              ),
              Container(
                width: width/3 * 1.9,
                child: Text(tipLabel)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.router.push(ExpandedTipRoute(tipID: tipID));
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(DARK_PINK),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  )
                ),
                child: const Text("See what you can do")
              )
            ],
          )
        ],
      ),
    ),
   );
  }
}
