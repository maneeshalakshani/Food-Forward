import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/models/Badge.dart';

class ShareCard extends HookWidget {
  const ShareCard({
    Key? key, 
    required this.context,
    required this.data,
  }) : super(key: key);
  final BuildContext context;
  final DocumentSnapshot data;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final badge = BadgeClass.fromSnapshot(data);

   return Container(
    color: LIGHT_PINK,
    width: width,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          child: Row(
            children: [
              SizedBox(
                width: width / 3 * 0.8,
                child: Center(
                  child: Image.asset(
                    badge.imageUrl,
                    height: 70,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.only(right: 15),
                width: width/3 * 1.9,
                child: Text(badge.description),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: (){},
            child: const Text(
              "Share",
              style: TextStyle(
                color: DARK_PINK,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    ),
   );
  }
}
