import 'package:flutter/material.dart';

class PieChartListData {
  late Color color;
  late double? value;
  double? radius = 105;
  String? title = "";

  PieChartListData({required this.color, required this.value});
}