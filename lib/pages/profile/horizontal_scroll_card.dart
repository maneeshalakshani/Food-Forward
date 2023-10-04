import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScrollCard extends HookWidget {
  const ScrollCard({
    Key? key, 
    required this.imageURL,
    required this.textLabel,
    required this.route,
  }) : super(key: key);
  final String imageURL;
  final String textLabel;
  final route;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        context.router.push(route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageURL,
              height: 50,
            ),
            Text(textLabel),
          ],
        ),
      ),
    );
  }
}
