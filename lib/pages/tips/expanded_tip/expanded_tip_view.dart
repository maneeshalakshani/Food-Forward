import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/Components/squareButton.dart';
import 'package:food_forward/pages/tips/expanded_tip/tip_detailed_card.dart';
import 'package:food_forward/pages/tips/tip_state.dart';
import 'package:food_forward/pages/tips/tips_list.dart';
import 'package:food_forward/routes/routes.gr.dart';

class ExpandedTipView extends HookWidget {
  const ExpandedTipView({
    Key? key, 
    required this.tipID,
    required this.tipItem,
    required this.tipStore,
  }) : super(key: key);
  final int tipID;
  final TipItem tipItem;
  final TipStore tipStore;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ClickableContainer(
                text: tipStore.tipsList[tipID].tipTitle,
                bgColor: DARK_PINK,
                width: width,
                textColor: BLACK,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  tipStore.tipsList[tipID].text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: height/10 * 5.3,
                child: ListView.separated(
                  itemCount: tipItem.steps.length,
                  itemBuilder: (context, i){
                    return TipDetailedCard(
                      stepNumber: i, 
                      text: tipItem.steps[i],
                      tipStore: tipStore,
                      tipId: tipID,
                    );
                  }, 
                  separatorBuilder: (context, i) => const SizedBox(height: 20,)),
              ),
              SquareButton(
                onPressed: () => context.router.push(TipsRoute(tipStore: tipStore)), 
                text: "Back to Tips"
              ),
            ],
          ),
        ),
      ),
    );
  }
}
