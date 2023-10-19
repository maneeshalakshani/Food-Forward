import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/tips/expanded_tip/tip_detailed_card.dart';
import 'package:food_forward/pages/tips/tips_list.dart';

class ExpandedTipView extends HookWidget {
  const ExpandedTipView({
    Key? key, 
    required this.tipID,
    required this.tipItem,
  }) : super(key: key);
  final int tipID;
  final TipItem tipItem;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ClickableContainer(
                text: tipsList[tipID].tipTitle,
                bgColor: DARK_PINK,
                width: width,
                textColor: BLACK,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  tipsList[tipID].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: height/10 * 7.1,
                child: ListView.separated(
                  itemCount: tipItem.steps.length,
                  itemBuilder: (context, i){
                    return TipDetailedCard(
                      tipNumber: i, 
                      text: tipItem.steps[i],
                    );
                  }, 
                  separatorBuilder: (context, i) => const SizedBox(height: 20,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
