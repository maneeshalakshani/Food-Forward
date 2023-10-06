import 'package:flutter/material.dart';

class PieChartListData {
  late Color color;
  late double? value;
  double? radius = 105;
  String? title = "";

  PieChartListData({required this.color, required this.value});
}

List<PieChartListData> totalDonationlistData = [
  PieChartListData(color: Colors.pink, value: 12),
  PieChartListData(color: Colors.orange, value: 100),
];

List<PieChartListData> communitylistData = [
  PieChartListData(color: Colors.green, value: 66),
  PieChartListData(color: Colors.blue, value: 23),
];

List<PieChartListData> tEnvironmentlistData = [
  PieChartListData(color: Colors.red, value: 12),
  PieChartListData(color: Colors.yellow, value: 100),
];