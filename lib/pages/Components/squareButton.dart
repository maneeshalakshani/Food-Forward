import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SquareButton extends HookWidget {
  const SquareButton({
    Key? key, 
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 121, 32, 26),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: (){},
        child: SizedBox(
          width: width/10 * 7.5,
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
