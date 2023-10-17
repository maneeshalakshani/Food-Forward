import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/profile/horizontal_scroll_card.dart';
import 'package:food_forward/pages/profile/share_card.dart';
import 'package:food_forward/pages/profile/srollIems.dart';

class MyProfileView extends HookWidget {
  const MyProfileView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height/15,
              color: LIGHT_PINK,
              child: const Center(
                child: Text(
                  "My Profile", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height/10 * 1.8,
              child: Row(
                children: [
                  SizedBox(
                    width: width/2.5,
                    child: const Center(
                      child: CircleAvatar(
                        maxRadius: 45,
                        backgroundImage: AssetImage(
                          "assets/avatar.png",
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "MANEESHA LAKSHANI",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Bronze User 1/3",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple
                        ),
                      ),
                      Image.asset(
                        "assets/delivery.png",
                        height: 40,
                      )
                    ],
                  ),
                ],
              ),
            ),

            //horizontal scroll
            Container(
              width: width,
              height: height / 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: horizontalScrollList.length,
                itemBuilder: (context, i){
                  return ScrollCard(
                    imageURL: horizontalScrollList[i].imageURL, 
                    textLabel: horizontalScrollList[i].name,
                    route: horizontalScrollList[i].route,
                  );
                }, separatorBuilder: (BuildContext context, int index) => Container(color: Colors.black, width: 1,),
              ),
            ),

            //vertical scroll
            Container(
              height: height/1.9,
              width: width,
              margin: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                itemCount: 5,
                itemBuilder: (context, i){
                  return const ShareCard(
                    imageURL: LOGO_URL, 
                    text: "ryghae aehgie iughaeg eugaiueg a egiuaehgiuae eiughiaeuhg iuhiuhguaeh aiughaehurg aeiugaeiuhg eiughaueg urghh aiughiae iaeuhg",
                  );
                }, 
                separatorBuilder: (context, i)=> const SizedBox(height: 10,)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
