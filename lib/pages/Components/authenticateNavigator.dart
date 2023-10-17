import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthenticateNavigator extends HookWidget {
  const AuthenticateNavigator({
    Key? key, 
    required this.text,
    required this.linkText,
    required this.route,
  }) : super(key: key);
  final String text;
  final String linkText;
  final route;

  @override
  Widget build(BuildContext context) {
      return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              context.router.push(route);
            },
            child: Text(
              linkText,
              style: const TextStyle(
                color: Color.fromARGB(255, 200, 55, 45),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
