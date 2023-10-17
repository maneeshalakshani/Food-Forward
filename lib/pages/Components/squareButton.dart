import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SquareButton extends HookWidget {
  const SquareButton({
    Key? key, 
    required this.onPressed,
    required this.text,
    this.btnWidth,
    this.btnColor,
    this.btnPadding,
    this.btnMargin,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;
  final double? btnWidth;
  final Color? btnColor;
  final EdgeInsetsGeometry? btnPadding;
  final EdgeInsetsGeometry? btnMargin;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: btnMargin ?? const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor ?? const Color.fromARGB(255, 121, 32, 26),
          padding: btnPadding ?? const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: btnWidth ?? width/10 * 7.5,
          child: Center(
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
