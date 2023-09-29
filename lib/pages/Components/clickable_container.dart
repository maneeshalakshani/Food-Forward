import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_forward/routes/routes.gr.dart';

class ClickableContainer extends HookWidget {
  const ClickableContainer({
    Key? key, 
    this.bgColor, 
    this.textColor,
    this.height,
    this.width,
    required this.route,
    required this.text
  }) : super(key: key);

  final Color? bgColor;
  final String text;
  final Color? textColor;
  final double? height;
  final double? width;
  final route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.router.push(ProfileRoute());
      },
      child: Card(
        color: bgColor ?? Colors.black,
        child: SizedBox(
          height: height ?? 100,
          width: width ?? 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
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
