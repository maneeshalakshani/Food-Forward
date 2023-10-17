import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/stats/specified_stat_view/pieChartData.dart';
import 'package:food_forward/routes/routes.gr.dart';

class MyStatsView extends HookWidget {
  const MyStatsView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "My Stats",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "Small act, big impact",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Center(
                child: Image.asset("assets/home.jpg",),
              ),
              ClickableContainer(
                text: "Total Donations",
                width: width,
                bgColor: LIGHT_PINK,
                textColor: BLACK,
                route: SpecifiedStatRoute(
                  title: "Total Donations",
                  dataList: totalDonationlistData,
                  heroWord: "You're a true warrior!",
                  heroWordColor: Colors.pink,
                ),
              ),
              ClickableContainer(
                text: "Community Contributions",
                width: width,
                bgColor: LIGHT_PINK,
                textColor: BLACK,
                route: SpecifiedStatRoute(
                  title: "Community Contributions",
                  dataList: communitylistData,
                  heroWord: "You're a community hero!",
                  heroWordColor: const Color.fromARGB(255, 45, 120, 154),
                ),
              ),
              ClickableContainer(
                text: "Environmental Impact",
                width: width,
                bgColor: LIGHT_PINK,
                textColor: BLACK,
                route: SpecifiedStatRoute(
                  title: "Environmental Impact",
                  dataList: tEnvironmentlistData,
                  heroWord: "You're a green guardian!",
                  heroWordColor: const Color.fromARGB(255, 52, 149, 102),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
