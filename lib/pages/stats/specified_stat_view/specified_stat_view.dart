import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';
import 'package:food_forward/pages/Components/appbar.dart';
import 'package:food_forward/pages/Components/clickable_container.dart';
import 'package:food_forward/pages/Components/sideNav.dart';
import 'package:food_forward/pages/stats/specified_stat_view/customPieChart.dart';
import 'package:food_forward/pages/stats/specified_stat_view/pieChartData.dart';

class SpecifiedStatView extends HookWidget {
  const SpecifiedStatView({
    Key? key, 
    required this.title,
    required this.dataList,
    required this.heroWord,
    required this.text,
    this.heroWordColor,
    required this.percentage,
  }) : super(key: key);
  final String title;
  final List<PieChartListData> dataList;
  final String heroWord;
  final Color? heroWordColor;
  final String text;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(),
      drawer: SideNav(),
      body: SingleChildScrollView(
        child: Container(
          height: height-160,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(120, 0, 0, 0)),
            borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomPieChart(dataList: dataList,),
                ClickableContainer(
                  text: text,
                  bgColor: LIGHT_PINK,
                  textColor: BLACK,
                  width: width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    heroWord,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: heroWordColor ?? Colors.orange,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/home.jpg",
                  height: 120,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
