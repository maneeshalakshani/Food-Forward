import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';

class TipDetailedCard extends HookWidget {
  const TipDetailedCard({
    Key? key, 
    required this.tipNumber,
    required this.text,
  }) : super(key: key);
  final String text;
  final int tipNumber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

   return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        SizedBox(
          width: width/10,
          child: Center(
            child: Text(
              (tipNumber+1).toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          width: width/10 * 6.5,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          width: width/10 * 1.5,
          child: Image.asset(
            LOGO_URL,
            height: 40,
          ),
        )
      ],
    ),
   );
  }
}
