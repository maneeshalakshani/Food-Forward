import 'package:flutter/material.dart';
import 'package:food_forward/const.dart';

PreferredSizeWidget appBar({
  String? title
}){
  return AppBar(
    title: Text(
      title ?? APP_NAME,
    ),
    backgroundColor: BLACK,
  );
}