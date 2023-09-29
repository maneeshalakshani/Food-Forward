import 'package:flutter/material.dart';
import 'package:food_forward/routes/routes.gr.dart';

final _appRouter = AppRouter();

void main() => runApp(MaterialApp.router(
  debugShowCheckedModeBanner: false, //remove debug_banner

  routerDelegate: _appRouter.delegate(),
  routeInformationParser: _appRouter.defaultRouteParser(),
));
