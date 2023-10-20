import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/const.dart';

class ClickableContainer extends HookWidget {
  const ClickableContainer({
    Key? key, 
    this.bgColor, 
    this.textColor,
    this.height,
    this.width,
    this.imgUrl,
    this.route,
    this.otherFunction,
    required this.text
  }) : super(key: key);

  final Color? bgColor;
  final String text;
  final Color? textColor;
  final double? height;
  final double? width;
  final route;
  final String? imgUrl;
  final otherFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otherFunction ?? (){
        route != null 
          ? context.router.push(route)
          : null ;
      },
      child: Card(
        color: bgColor ?? BLACK,
        child: Container(
          height: height ?? 120,
          width: width ?? 100,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imgUrl != null ? Image.asset(imgUrl!, height: 40,) : const SizedBox(),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                    color: textColor ?? Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
