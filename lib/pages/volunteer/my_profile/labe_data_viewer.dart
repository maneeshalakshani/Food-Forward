import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LabelDataViewer extends HookWidget {
  const LabelDataViewer({
    Key? key, 
    required this.label,
    required this.text,
  }) : super(key: key);
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width/5 * 0.8,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            width: width/5 * 0.2,
            child: const Text(
              " : ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(
            width: width/5 * 2.5,
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
