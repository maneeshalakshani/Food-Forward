import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/stats/specified_stat_view/pieChartData.dart';
import 'package:food_forward/routes/routes.gr.dart';
import 'package:food_forward/services/authentication.dart';
import 'package:food_forward/services/user_services.dart';

class MyStatsView extends HookWidget {
  const MyStatsView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String userId = Authentications().getCurrentUserId();

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
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
                otherFunction: () async {
                  final text = await getText(statType: 'donation', userId: userId);
                  final percentage = await getPercentage(statType: 'donation', userId: userId);

                  List<PieChartListData> totalDonationlistData = [
                    PieChartListData(color: Colors.pink, value: percentage),
                    PieChartListData(color: Colors.orange, value: 100.0-percentage),
                  ];

                  context.router.push(SpecifiedStatRoute(
                    title: "Total Donations",
                    dataList: totalDonationlistData,
                    heroWord: "You're a true warrior!",
                    heroWordColor: Colors.pink,
                    text: text,
                    percentage: percentage
                  ));
                },
              ),
              ClickableContainer(
                text: "Community Contributions",
                width: width,
                bgColor: LIGHT_PINK,
                textColor: BLACK,
                otherFunction: () async {
                  final text = await getText(statType: 'community', userId: userId);
                  final percentage = await getPercentage(statType: 'community', userId: userId);

                  List<PieChartListData> communitylistData = [
                    PieChartListData(color: Colors.green, value: percentage),
                    PieChartListData(color: Colors.blue, value: 100.0-percentage),
                  ];


                  context.router.push(SpecifiedStatRoute(
                    title: "Community Contributions",
                    dataList: communitylistData,
                    heroWord: "You're a community hero!",
                    heroWordColor: const Color.fromARGB(255, 45, 120, 154),
                    text: text,
                    percentage: percentage
                  ));
                },
              ),
              ClickableContainer(
                text: "Environmental Impact",
                width: width,
                bgColor: LIGHT_PINK,
                textColor: BLACK,
                otherFunction: () async {
                  final text = await getText(statType: 'env', userId: userId);
                  final percentage = await getPercentage(statType: 'env', userId: userId);

                  List<PieChartListData> tEnvironmentlistData = [
                    PieChartListData(color: Colors.red, value: percentage),
                    PieChartListData(color: Colors.yellow, value: 100.0-percentage),
                  ];

                  context.router.push(SpecifiedStatRoute(
                    title: "Environmental Impact",
                    dataList: tEnvironmentlistData,
                    heroWord: "You're a green guardian!",
                    heroWordColor: const Color.fromARGB(255, 52, 149, 102),
                    text: text,
                    percentage: percentage
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  getPercentage({required String statType, required String userId}) async {
    UserUtilities userUtilities = UserUtilities();
    double totDonations = await userUtilities.getTotalDonation(userId: userId);
    double envImpact = await userUtilities.calculateEnvironmentalImpactRatio(userId: userId);
    double comContributions = userUtilities.calculateCommunityContributionsPercentage(envImpact, totDonations);

    if(statType == 'donation'){
      return totDonations;
    }else if(statType == 'community'){
      return comContributions;
    }else{
      return envImpact;
    }
  }

  getText({required String statType, required String userId}) async {
    double percentage = await getPercentage(statType: statType, userId: userId);
    String formattedPercentage = percentage.toStringAsFixed(2); // Round to 2 decimal places
    if(statType == 'donation'){
      return "You have made $formattedPercentage% of all Donations";
    }else if(statType == 'community'){
      return "You have made $formattedPercentage% of all Community Contributions";
    }else{
      return "You have saved $formattedPercentage% of CO2 emmissions & contributed to greener planet";
    }
  }
}
