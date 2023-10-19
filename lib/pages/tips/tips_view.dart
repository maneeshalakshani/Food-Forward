import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/tips/tip_card.dart';
import 'package:food_forward/pages/tips/tips_list.dart';

class TipsView extends HookWidget {
  const TipsView({
    Key? key, 
  }) : super(key: key);


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
                text: "discover helpful tips".toUpperCase(),
                bgColor: DARK_PINK,
                width: width,
                textColor: BLACK,
              ),
              SizedBox(
                height: height/10 * 7.1,
                child: ListView.separated(
                  itemCount: tipsList.length,
                  itemBuilder: (context, i){
                    return TipCard(
                      imageURL: LOGO_URL, 
                      tipLabel: tipsList[i].tipTitle,
                      tipID: i,
                      tipItem: tipsList[i],
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
