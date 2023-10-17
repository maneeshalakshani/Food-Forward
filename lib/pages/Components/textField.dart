import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomeTextField extends HookWidget {
  const CustomeTextField({
    Key? key, 
    required this.label,
    this.prefixIcon,
    this.marginTop = 15,
    this.showTopLabel = false,
  }) : super(key: key);
  final String label;
  final IconData? prefixIcon;
  final double? marginTop;
  final bool? showTopLabel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width/10 * 7.5,
      margin: EdgeInsets.only(top: marginTop!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showTopLabel == true 
            ? Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ) 
            : const SizedBox(),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter $label',
              labelText: label,
              filled: true,
              fillColor: const Color.fromARGB(168, 227, 226, 226),
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            ),
          ),
        ],
      ),
    );
  }
}
