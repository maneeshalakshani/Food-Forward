import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/tips/tip_card.dart';
import 'package:food_forward/pages/tips/tip_state.dart';

// ignore: must_be_immutable
class TipsView extends HookWidget {
  TipsView({
    Key? key, 
    required this.tipStore,
  }) : super(key: key);
  TipStore tipStore;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TipStore tipStore = TipStore();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ClickableContainer(
                text: "discover helpful tips".toUpperCase(),
                bgColor: DARK_PINK,
                width: width,
                textColor: BLACK,
              ),
              SizedBox(
                height: height/10 * 7.1,
                child: ListView.separated(
                  itemCount: tipStore.tipsList.length,
                  itemBuilder: (context, i){
                    return TipCard(
                      imageURL: 'assets/bulb.png', 
                      tipLabel: tipStore.tipsList[i].tipTitle,
                      tipID: i,
                      tipItem: tipStore.tipsList[i],
                      tipStore: tipStore,
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
