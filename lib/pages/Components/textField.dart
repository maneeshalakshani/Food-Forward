import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomeTextField extends HookWidget {
  const CustomeTextField({
    Key? key, 
    required this.label,
    this.prefixIcon,
    this.marginTop = 15,
    this.showTopLabel = false,
    this.textColor = Colors.black,
    required this.controller,
    this.obscureText = false,
    this.errorText,
  }) : super(key: key);
  final String label;
  final IconData? prefixIcon;
  final double? marginTop;
  final bool? showTopLabel;
  final TextEditingController controller;
  final Color? textColor;
  final bool obscureText;
  final String? errorText;

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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
              ) 
            : const SizedBox(),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return errorText ?? "Cannot be null";
              } 
              // else if (value.contains('@')) {
              //   return 'Please don\'t use the @ char.';
              // }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Enter $label',
              labelStyle: TextStyle(
                color: textColor,
              ),
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
