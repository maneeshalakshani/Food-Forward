import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/pages/stats/specified_stat_view/pieChartData.dart';

class CustomPieChart extends HookWidget {
  const CustomPieChart({
    Key? key, 
    required this.dataList,
  }) : super(key: key);
  final List<PieChartListData> dataList;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    List<PieChartSectionData> generatePieChartDataList({required List<PieChartListData> dataList}){
      return List.generate(dataList.length, (index){
        return PieChartSectionData(
          value: dataList[index].value,
          color: dataList[index].color,
          radius: dataList[index].radius,
          title: dataList[index].title,
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: height/4,
        child: PieChart(
          PieChartData(
            sections: generatePieChartDataList(dataList: dataList),
          ),
        ),
      ),
    );
  }
}